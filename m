Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp227783ejc;
        Thu, 19 Jan 2023 02:36:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/PzuvydfR+BS3WAs+Th698ZCoqyXzkkAipa6rgYLRbrNwOhtzrVA648+ObZ6eXj9dIpgQ
X-Received: by 2002:adf:f606:0:b0:24b:b74d:8012 with SMTP id t6-20020adff606000000b0024bb74d8012mr8761508wrp.18.1674124568357;
        Thu, 19 Jan 2023 02:36:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674124568; cv=none;
        d=google.com; s=arc-20160816;
        b=OET0UxBRTx4rVbrcfmOkDrEvpqCgpPL2E3ZdK0GLmlh1a9dj3mlLzf46gq7KJ7KgRp
         Vsm9VCn57JudulsNKN8CqmPOBoLA3ojdAitUsxh1IqdJwgSZiS7FZ9HFMro3c4srAcoB
         B7f3SkJ4ekR4IteZAiUDxziUI5CQ1LZY9tDopPNjB4JeSEiRLzAGGl+hXuyrjtF28c4p
         joRw7vT0sxtPG3oXiquxAs2Lc1fIhG/Xdhlwv85IhjJ4L6bnAudHfJvRJMZcdDrf6zIA
         FC7AZ/KoFdW4s5cFMF+NY/O0bYfVj0N5H9nGBa2BsKF1WHgOVxHm2VYdfNfig9Gbz53w
         Ea8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pLv/IeekQ6asy/TnS2KItaiEJBaORyeIW0DUoj6ybic=;
        b=iVhiMWkBYhhXAlVUBNEdzZqJ+AMbKqY/PwFYlJ+TR19Eon5//UPu6rQfTEWqL/nczB
         5faDXaZzbIvhTfcdwELY+N0Pl8T24e/SB0YqsI6lhHv//lmgMSBCPUfVpg9keGaJ06q0
         qmBRntCROjQmHkCp7BdNTX9Vj4ivKdKCzrOkLt6sWMqDDxDpMMSHEBiCmbPbWAE/xPrL
         tPCr9DCI91mNm0k4zfFa4lej6Uls4UsTPXUQbt5tWn3zcvSpTnT+KBeg26YXyOY27YpK
         2D+9rqZH8pLRGjytpuo7EqaI609ajHHPjD4GDQCzrArIW9TpbHNp29+nznFZz7wZtBOV
         11mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMOaDQTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020adfeb50000000b002bdef935fddsi15986145wrn.590.2023.01.19.02.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 02:36:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMOaDQTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pISH7-0006Nz-MV; Thu, 19 Jan 2023 05:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISH6-0006HB-Q6
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:36:04 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISH5-0003Pb-6A
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:36:04 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b7so1408688wrt.3
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 02:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pLv/IeekQ6asy/TnS2KItaiEJBaORyeIW0DUoj6ybic=;
 b=PMOaDQTcJyuOsW1fy6NHvfCVkBM6NDX2OqxkAXifD+XBj5P5mMw0j73L9s/hSWOrq/
 xChQzBhlfgy8SV/IHq0zZiBBtg0Pqjw59ad76EQmsYivZrA7ysDE7Kz17UX6vUvrztOA
 524adC8cQYJPXli4Pnw9ZUXnVWNTuWIcmMoZaghjBgRWU1n2Wb/ck6unL46yjfp5vytC
 g9cGjSvPyWYA62JH8lKqGhFBqy2FYTL0ZR4cbtdhUM6fG7SYo9y75P0aUy8oZEu2oV8t
 ZjjfqCJzA9qIJ4QoLNTVdEL7GDjNQPUJZTYN2SmctQrXJEjxG89crYNqQJ52nOkntiQt
 xS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pLv/IeekQ6asy/TnS2KItaiEJBaORyeIW0DUoj6ybic=;
 b=SRbl/SNxipk6lrdcymMnidWEvtjPdJk7aSRkcTXciyE0gxPaINLDpDSHHjZqgBC1Q6
 46bZTs+v6qzujXZUkgpXmkn7k7aW1JL1SZGDjN73yyKve6w1soOVQbGX5Er4E9GOgvUC
 V0xPjurC0Uw6CJ/Q3I2a3gTVaaOmrJfDfU6rELSWAnmY+eQDBVF/X5iqv7wA7JxrmRoa
 JZ47fk/Bh5Y5fJre9CB0l4065ONql6UhRG1yMo7WRQS4aOHKMhqtzbsG5ZV3m7oWmWCi
 28O31QJBpq0y+B2Q46Xjn6i9TjZjfF0Rq2Jf2BVztjnOeEFlGd/M5G6+mtYjVyqirX6H
 1xUw==
X-Gm-Message-State: AFqh2ko7RPXtFJeCOTZjJyqiDXiVcmlakpk102Oq17oHJU7USrVPJS1s
 CRA2EqmvBL1qAtfpAt1KwhOLdQ==
X-Received: by 2002:adf:ff8c:0:b0:277:2e27:61eb with SMTP id
 j12-20020adfff8c000000b002772e2761ebmr8645143wrr.24.1674124561943; 
 Thu, 19 Jan 2023 02:36:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a1-20020a5d4d41000000b002bdef155868sm13855613wru.106.2023.01.19.02.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:36:01 -0800 (PST)
Message-ID: <d6943d88-077b-a0ff-c9b9-4a224938f49a@linaro.org>
Date: Thu, 19 Jan 2023 11:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 11/19] net: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-12-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119065959.3104012-12-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g9dGfPgnHPGA

On 19/1/23 07:59, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   net/vmnet_int.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

