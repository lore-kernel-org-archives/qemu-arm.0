Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1288498ejf;
        Fri, 12 Aug 2022 10:56:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR574hYw2c8dEE+hwTi7C5bKvFU6ginXU8IGnyrgeQWxfDc/G92e02Q+Ac3SsblMvvP2JRBZ
X-Received: by 2002:a05:6214:29ef:b0:477:388:cb50 with SMTP id jv15-20020a05621429ef00b004770388cb50mr4312694qvb.107.1660326987481;
        Fri, 12 Aug 2022 10:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660326987; cv=none;
        d=google.com; s=arc-20160816;
        b=GZBI4XiVtJJIQrflMxbB+voauYJeNjXb8a2mdP6LRuKX7RgBhyMvh8bcCyvzfZ0Ha9
         t5ucqw6Y+ZMdrES/ctGtb5WMGzQDyCH6Q+KGzvUauXCOsVfkFBvZD2VBEOwG5wKkzyyT
         BB7G3GEQZYj+Nizjl4juBHGpKt1ohao7rIvbemoQnXlmHRJUbBLIA2Qt+9tP+l6FMEMr
         HgSpRjG5K1JjNKfMyo2Jy+ENC6rK53TpzFZiWIqDyUauXJr2I6xPENoD1KkTDeAmPpHz
         v2F6Sa4ZGS3PmIzXw+n12UBFkd3wwyr88QgdnoqYUYh7wvGTJjPs1RYn4T2mQu/xL0ac
         8hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1hhCpWSM04GCt+NsDHRBvvjLjdGAbeiIi7V9QJIyBBg=;
        b=VKLvg1p5f8Fx51+R5aiN8SrrHX9Zp8dU3BxqF6TUzd0aBBE5s3z1xf2u5sQ1zBUfbZ
         +cg8BSrvIO0mGQA2izjiBLFwt3mD6iPE/lbJY2fh3hsrNTmWKk/CeJikzL/YjJWjk5Ll
         ibdtKOYR8Bu1h/oKIIY8P8qU0hHIkS64JzRJ0mdYED5e2RotH/sCOnhV4C9b+7m6GFb4
         dtRZe6bfD+lzAVgzj08ePDUtemToaOwdnbpiFJ5Y0BOEXseeOrOrEBMDVmXP3EYNieFs
         5dAtwW1YFTVJkxp5v9c01BdmRrR6EISM8VXPi8XuyCkJISOlky0HZUK6DaOrzXmCi8pD
         gHLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v3x2vPQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24-20020ac86158000000b0033c95909615si1696705qtm.495.2022.08.12.10.56.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Aug 2022 10:56:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v3x2vPQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMYtV-0004cO-IF
	for alex.bennee@linaro.org; Fri, 12 Aug 2022 13:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMYs1-0003rN-Hs
 for qemu-arm@nongnu.org; Fri, 12 Aug 2022 13:54:53 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMYrz-00046e-V6
 for qemu-arm@nongnu.org; Fri, 12 Aug 2022 13:54:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ha11so1654321pjb.2
 for <qemu-arm@nongnu.org>; Fri, 12 Aug 2022 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=1hhCpWSM04GCt+NsDHRBvvjLjdGAbeiIi7V9QJIyBBg=;
 b=v3x2vPQjl9XDcdPWu8QXJE3FzHXTvqTVNeDx1v+X8m0iB45MDhyVZDTgW5o2+MGU03
 g57BFagW2gVuNMFZ+hAW6H8buGFm//ZiKOCo1XA2Dg3VPd2jyroVrSTEw3Zy1DAA401i
 nhpUwsEzeX6upRV0zxa8CjC1Jm2e1KkCICIVfpslSffPGv/2N0fGTtWaFRxhaXO89OQz
 Hnuw3KnXcXY8KezBp/hyPyYSrwGNLbnnKBf3tkB/C4lcN0ygz4TqDztYU3Loj7LeE8xm
 9dps2MdJ3IIKtvtGDPrt4hBzrdG+69hI8v8xNuPv1Dw2dwb34VnivZSyB2SqaMaXdAJd
 1bGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=1hhCpWSM04GCt+NsDHRBvvjLjdGAbeiIi7V9QJIyBBg=;
 b=DBqPOaw8ifHRuPSJ1I8ncoANelffniJcphWHC+CzIWUjBiTEEiNsocERShq8Ug8fPl
 CI0aWym/ThmT40d6lDOY8hM8SgzHwuTK5eNY5O1XuH/0EsH+Wquj2445cdpERaBz6uN4
 zeA0YWjuxAUH+2uSLjOtVDDyQrg+R25c3Y2F6ZWaoSjPPtD5/jqHwFkgCvtsuFLmKLRG
 qIr1hx00if4ICy59hAVb+Z/ap5QQUDuLB9knpmysetEhbaiVs6MCKGgoqr37LyCyGK8L
 PRtsvXIRJV8+WGFudweAupiDBSi5NVVMDUrNH78wjHh2myTeI1JMsHavBWiEjx+w77Bs
 0Fdw==
X-Gm-Message-State: ACgBeo0nBVLgU383SX0HUc1BmD7EVuIKMSJGqiKSJm7GlFjiPa0PdOBY
 SnRy1hXxeVnPnHD7ajLUGSBNuw==
X-Received: by 2002:a17:902:d2c6:b0:16e:d285:c602 with SMTP id
 n6-20020a170902d2c600b0016ed285c602mr5116115plc.81.1660326890472; 
 Fri, 12 Aug 2022 10:54:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a170902d38900b0016dcc381bbasm2005173pld.144.2022.08.12.10.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 10:54:48 -0700 (PDT)
Message-ID: <a159021a-bcad-aadd-f57a-197b54eb0160@linaro.org>
Date: Fri, 12 Aug 2022 10:54:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/62] target/arm: Implement FEAT_HAFDBS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <CAFEAcA95O5N_gOJ88zkaPx5BvTFYSSOLF=7XMFc3egCU+s1RkQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA95O5N_gOJ88zkaPx5BvTFYSSOLF=7XMFc3egCU+s1RkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PKwAbumJIyfR

On 8/12/22 09:31, Peter Maydell wrote:
> Is it possible to rearrange this patchset so the easy
> refactoring patches that do "use a struct to return
> values from get_phys_addr and friends" are at the front
> (ie before the stuff that touches core code) ?
> That way they're easy to take into the tree early while
> the rest of the series is still under review...

Yes, I think so.


r~
