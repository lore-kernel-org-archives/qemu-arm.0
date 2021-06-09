Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5578802lfa;
        Wed, 9 Jun 2021 10:09:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRzf6KBUKlWob0g+Icly60fx/RFS7YD0eg6AicNtU/JUcJNle6eM1QNnrOF8IwhUGT0RF3
X-Received: by 2002:a1c:2cc3:: with SMTP id s186mr11088320wms.150.1623258588191;
        Wed, 09 Jun 2021 10:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623258588; cv=none;
        d=google.com; s=arc-20160816;
        b=K97cEypwBVI+DI+hSHPfO+rQDdaDJL/oEElYLdE2BT4uqRCu7VlwWeFafAQD4E7LQO
         BIp9Yuy/J/vETqPEDrJKttk39KkIgvMfu4en5HzO3J1qQ9JaZmfnJzPOetWL60R2VqGM
         1T/ffWIC1epbr/gam7ZEYSNISRWl+smTtTDOTZzuaghzYx8KMC9imBtk+3yZDmQiUnlR
         r4ylaB13PnLQQBuuR3/0EJW0BOefBEkeCi2YSal4sAwTBeY81fPCgO+Kd75jDshJYx4L
         YuoSR6kl4gG7FgNeyL/FNwpENsG2GaKdLNLFo4r6zFgFDJ83lN1u+c3CFrwsiLOA1rCB
         mDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qDvA89B5kPlQWacV7NDu1Zp0msJjeFgFm4PDbPoGIKY=;
        b=uhEOZTdnghrYpkkCqpJkc27qfVlKH+BmJSte8R5aoPsa4eZCVOoXC3jmFIjhiNlng/
         2MGG7KhzBZmNP1TygCplZgUNyJAapqG6Mlusb8oae+V8Jbp3tt3FwJ+0kRnSLF+4RTLU
         H1YSv0gBVxzldRqqT6IicRa+KMTF0UlXJVsxZ1t/gcnED7Qsi9oETTTmD849/p3lEdVm
         xQnEc8GpnXtD6LRa0JYJ5LjISvN2a6oPaat2G0oJ4gYrIcb/KpUy3eiRMwfo2ve4rUdT
         1fjs7hLL7PSOr3O73o+H3gFjKdZ1wUFyYD3du2P98H1JF+LtbjznfU0hGspDmw5xu/T2
         ogsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pADAAFfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si364392wrf.491.2021.06.09.10.09.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 10:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pADAAFfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr1i7-0007c5-Bc
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 13:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1hv-0007bm-GJ
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 13:09:35 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1ht-000236-06
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 13:09:35 -0400
Received: by mail-pf1-x429.google.com with SMTP id x73so18886671pfc.8
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qDvA89B5kPlQWacV7NDu1Zp0msJjeFgFm4PDbPoGIKY=;
 b=pADAAFfkeMvQbDv3P7yr8xolUFfbIDHeQU74UJZ7MY3BUeORAkR501Czr1nFtDlB8d
 Rv3nlDgI/ouWc/UloYRKwM1ixiHFy3xXWBOqzVkcuQ5hsrNBneeSEkDxCRRHNkMDk6Pl
 vIztfI6csJHRFEXwM6J/c3nST2IpWzLWMPm5VblMnAtpv/TlxttNfP39GAKDcgg/OPdy
 k3MccB0JGFL0dAjzrpgC9x4d204sHG/8x2BTO5Q/PKHgKxf7KKoJGIKAbHIuzLZPN5xC
 hkkuG9kkNKu398lxj4zqrNe0aAY+SjwqKFgXhGeKpBm5L9a0ZDiF3LCdwN5VsDajwUNU
 KxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qDvA89B5kPlQWacV7NDu1Zp0msJjeFgFm4PDbPoGIKY=;
 b=txDklKDf9zpgrPFqvM8MGp712mS4m7UoqP6gmF4q8O2rg4VG6bPDQSeMPHL6+wMT9b
 si2mzsCoOvy4jFtAtxZT9HPJtthpWXIODE0uv//qtvYmYZpnejrQj98ZEO64uvyfnupx
 gy3sMoQ5fObS0vC+ft9wjxx2fCqzQCeUc39tMB18B5Tg9Nj+67NOSxEeGQvxu+zdwMzh
 GNM6ZrZtfq7b2xjJdtabO88HViMEosWAlC30v9heJ2vgkePdNUl5J+2Yd1ZdCrnL46Ti
 JL6h4q2EeCno9x1txbzIgk0kuDWLGd+V73DlpT+hhAek8Ee9AkNj9o9JKfUq1QfdPIj3
 OyIw==
X-Gm-Message-State: AOAM533uvMEKqHNBTGmUtH2oMJ3EdJzr6TAOJFuqtnexn7v23IpI0GMG
 7GpAdRJtAOlDGK5cAoZ3q8wt2Q==
X-Received: by 2002:a63:4915:: with SMTP id w21mr655644pga.363.1623258571612; 
 Wed, 09 Jun 2021 10:09:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r5sm5656886pjd.2.2021.06.09.10.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 10:09:31 -0700 (PDT)
Subject: Re: [PATCH 11/55] target/arm: Implement MVE VLDR/VSTR (non-widening
 forms)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-12-peter.maydell@linaro.org>
 <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
 <CAFEAcA_xEh2h8ZV4-mianY8wcz=TKdvdmFr+e4gikAUtW_THGQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7f4f43cf-2a9b-d08a-90f5-46f4f307b5f5@linaro.org>
Date: Wed, 9 Jun 2021 10:09:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xEh2h8ZV4-mianY8wcz=TKdvdmFr+e4gikAUtW_THGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jDw4J3VB1iia

On 6/9/21 3:01 AM, Peter Maydell wrote:
>> Is the spec forward looking to more than 7 Q registers?
>> It's tempting to just drop the D:Qd from the decode...
> 
> I don't know, but looking at the decode it certainly seems
> like the door is being left open to Q8..Q15. Other signs of
> this include the existence of the VFPSmallRegisterBank()
> function and the way that VLLDM and VLSTM have T2 encodings
> whose only difference from the T1 encodings is that you can
> specify registers up to D31. Decoding D:Qd and then doing the
> range check seemed more in line with the spirit of this...

I agree.  We should leave the decode in place.

Do you think it's worthwhile adding a single hook for the register range check 
now?  E.g.

   if (!mve_check_qreg_bank(s, a->qd | a->qn | a->qm)) {
       return false;
   }

static bool mve_check_qreg_bank(DisasContext *s, int qmask)
{
     /*
      * See VFPSmallRegisterBank, always true for armv8.1-m.
      * So only Q0...Q7 are supported.
      */
     return qmask < 8;
}

And, as needed, another one for dregs.


r~
