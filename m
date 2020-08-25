Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp82208lfc;
        Tue, 25 Aug 2020 11:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQjZb+7hteij6wOGSGLm3VHW5jLY9h4zhLZYT7AK1BGCneQk8R8hmpL9WmtLtQ4WUX5CaV
X-Received: by 2002:a25:2acc:: with SMTP id q195mr5147684ybq.361.1598379970195;
        Tue, 25 Aug 2020 11:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598379970; cv=none;
        d=google.com; s=arc-20160816;
        b=W8nGMMjf+RRg6oVw7Brgp8QZp1O4oxDqHUdezo7PYSO+KByxvfjLDtz1XE0kqvuFs8
         JnZytpX7Nql0yFR3jzT9pFudJPkhXqsDJN0UIRRq5+dKhl2qjsm4gxXWYxaTyNq/FtaO
         4gKZWLvbQdZzIqktyP0JYJR+qkX6Ch289Bx9xc3ovIw8Vs8fX7SQ37FfoUWh5ZR/37gf
         g85R7KOlmeLo2a3ze5PC9cCacAR5Pg2vDqtRROoeIevMDOLH1bw70pbjoNIYXBmhRK8L
         JSayXpBPUFQe7jnYgUCjR4lJ3jynayHYrdnahq9EUw0toH9ipSN+QdOM/qYI4fW/8efY
         lEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2pg996UxnJwvHSI4cSWU3b6jP5lrCuCVV3lrz7uIv2I=;
        b=XuSwpE4pRJ59p6KinLDiX/et8c+unrJP1VvUZnDCpeqgAAePVP4A20eK8tTWIdYXP8
         l8Yj1Co8E+/80YZ9wf1+iq1uA/RXz/O5d9M7RwHqTMZEsTq5mIYc2vHcrT4XaqV36Iur
         VayYitK0Bkznee97uBz1/VmA5raMfKsZaWUBKkyVmecqTV25FYgj5S6dr3615eg+wN4j
         oUJKBjHFBtReMwoSZIzHri8tl/7L3fOesI0DILLCWusB+YWTmVQVNWbmghEz8edEkyhW
         4wPCfxZlCwvvfQi9wkzzZs+3DYOXwKbOXlkYwN0iOhUHlYD6u2sRRmdBL05bpBf7wIDH
         +wLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hEbchXKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m77si16486987ybm.486.2020.08.25.11.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hEbchXKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAde5-0002m9-GO
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdd6-0002DD-DM
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:25:08 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:38539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdd4-0007IX-Ch
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:25:08 -0400
Received: by mail-pj1-x1044.google.com with SMTP id ep8so1657543pjb.3
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2pg996UxnJwvHSI4cSWU3b6jP5lrCuCVV3lrz7uIv2I=;
 b=hEbchXKFcHvSIAD7/mivSGnYE/tJUnH/1citf2ZACpCySEMI2G4eauATTDpAkW8mFl
 fPROLvuixhLDBksYxxmgpdTAJ52K2vwYmHxYfE724heKUccVPd2iwcUGfjxyBVYWSCkf
 O8DJkCcgtb0EcqOxJtheP5HuUffm6o51kq+Y4ucsE+tA+h6gso1rVFk7MtB+f/9C/GDk
 m++DLYyONuZDekQC3b3Bg4ZM7PwOOc0cRq/u/8A9cHbuiCWLHb01V9xmbwAMAYLqDqVn
 SOsX7mHXNm8I6cPItUu7or33ulRdjTCARczKVXLIPt5x60E1wskys/b7REAT2Y4i8j+W
 nu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2pg996UxnJwvHSI4cSWU3b6jP5lrCuCVV3lrz7uIv2I=;
 b=VyDOjjdEhadF4BSHHWJI8iZ7xcDP6VKyNAlh0SaOruT9a2wm3I7Pr0NVoifnGZXRi2
 Lo1/dQKChef1Zd6/9ju+AkGJp0yIK24pSX9pfCJKo9mjLKdrZosTR60nmbMabxKBXQIZ
 6s92KwxawSqlEcbSB3d3gZUNjOMP0UYfhYUByNwH/6QeAPBjGro2IpmJ+QFH2qFbEN9i
 lNAIIo8YHc13Odhmsi6R6c/PrfdP/9B37908B0XRzj3KmYQFwuqA40+z3BdE1L8J8p5A
 Smb7LK3CVJ5Ucb1IR3jjqJJUNFH5ZTev8P5vjEhjVrk3/uDfxmO+IrbFC6QbbIZcEkX9
 ZQBQ==
X-Gm-Message-State: AOAM533ldZSkwzSg80zTP9zU+aLBrNJ4wtnf6IUG37eOfBUneOUcegis
 i1NEhlnoY58htmyWhlduG6KZxw==
X-Received: by 2002:a17:90a:850b:: with SMTP id
 l11mr2517599pjn.25.1598379904894; 
 Tue, 25 Aug 2020 11:25:04 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id q34sm77449pgl.28.2020.08.25.11.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:25:04 -0700 (PDT)
Subject: Re: [PATCH 09/22] target/arm: Implement VFP fp16 for VMOV immediate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <836670c7-f14c-30e4-6078-5d450e42b828@linaro.org>
Date: Tue, 25 Aug 2020 11:25:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tsBPU9KQaKlm

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement VFP fp16 support for the VMOV immediate insn.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp.decode          |  2 ++
>  target/arm/translate-vfp.c.inc | 22 ++++++++++++++++++++++
>  2 files changed, 24 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
