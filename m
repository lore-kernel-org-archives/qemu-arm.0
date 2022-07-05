Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3639394lft;
        Mon, 4 Jul 2022 20:24:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHeVJeqSJr7wsgYiuz8lHSNJiR06WAaQWB85sAxaguoE7Bc46eWPctrIe9DyXybOpjW0D4
X-Received: by 2002:a25:5809:0:b0:66c:8709:3611 with SMTP id m9-20020a255809000000b0066c87093611mr32565952ybb.608.1656991464168;
        Mon, 04 Jul 2022 20:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656991464; cv=none;
        d=google.com; s=arc-20160816;
        b=hi2L2Y3XBXu0i0KUTTXwNVSVA4WyCSXtTeV2lm20WeRGBUgEtgWxAFyLVTUhTiQCus
         oC0tvjmBGyU8hg4CLT3+6Z7ePWndtptdcO+TGek3FXVwiC6MXKEmXfzsLthjEC6biVnX
         w2VEgbaK5gT/RsOUxFDoARD9bVK4ahVuNQWEvLeG95+watJx634Xa/z5H7QTsE7NYaY4
         RKYA5I5zu375Wk/3/aKzJtqWgPxgtGeWH7ff3Rx+Hm/fRYvXDY34LUI02t4bXyuQt5T7
         /lCyNuqZbgiOvCod6enH12D20izLgCbcmQJPCJgNM09whNcdQgZf7nx7gTpBtdJgfiw8
         ii7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MVvpbrHa6kMv9FamREUllnSG24yUEjpHJ6mfQxq02Og=;
        b=cgdCzMU7s/LkVFRUJY+9ktjUTsGT8KS67URvzR09f12hiig1v54kB4ZdEIPG28vACP
         JLmnxXgT0EKHfFRB+Cc+SgATINEOequpxIrUMs3LUO8WB6Rz8Y4fMAnbhTI5HgGpvTgv
         PORw6Sd8TEji7PYhHlnmToM8mcj9ihcpnXcaatGaFvQ+GEgfdvuBBAum2clgnyQLHkXt
         wIbGx7k2jkeXkM6mGWWl8hRKteyj1Q2CLzs2AlM0YP6QLK+nfc58E52eEGByHoPOZeXZ
         CHq7BK3bhBfFck6soeV+whXCFzdm5dNNruzyGxXnUz2r69pP7GX7Gxa2UjuhEl2XL+NT
         ck+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IJnFCYlF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a056902120100b0066db717c6c0si27678451ybu.666.2022.07.04.20.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 20:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IJnFCYlF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8ZAl-0006BL-JL
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 23:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZAb-0006B4-NX
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 23:24:13 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZAa-0003iE-3x
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 23:24:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso946361pjj.5
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 20:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MVvpbrHa6kMv9FamREUllnSG24yUEjpHJ6mfQxq02Og=;
 b=IJnFCYlFhcJlqypgrdEXK1OHetDmllhEbL2GKlxx4T5aOjvJX4V4OsAYizXs/XFpnD
 vdtybz7ErFKG/gEvdehaKSsT0QRhMcDyKb/6V0z1pFk4BlD6VZscPGas0gaXAi80+cs8
 57XGZUujhevDLzU/Y837Q+d0Gg/0S7LetRFfdEszpjBoquzeDCc5cFwUUTOKMYlfyGJy
 eUUtjkESWnlA/zPh8o6CyZQ2TtegTu9rgBfRQ4ppM1XLcgAHJCLzAQBx79LBOW/0VOTv
 hI05Yu6u/DrX1asRXdm3WP4ZVD2OkWlyoujVpo0Ab1Nxs1NXshhO4a3+yNyK8B3nAGrn
 yeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MVvpbrHa6kMv9FamREUllnSG24yUEjpHJ6mfQxq02Og=;
 b=PVSZiN2QKMIBWnHuTti8+mKp+VhD9tvb+3R71r8mQUPca4nDzkMCVCrUpW2syKdWlT
 O0huF4KaFcZees0wl5VKPReMFBozFKMpCJo2kl2Lkp9q8qX1LlV75+VhWo1AdIIFia3w
 B+MTnVutRVyDAJnTOMzkCVluHJN79DqgWYbAyv/HQoFjtxu2EOxz1IElBQgS9yDrGg/r
 n0gq/dl8VP3f4oZ2k/OYSCSzu7MDHjlL8fsUzU8YvTKFX1mcWlX6GikB0CqORpOoldQ2
 jmhJYxQ4oAiVW1UIz92nzB0TUtgYCSJubPD8ASgh7plTngpv2nkBBZgZ3/zeAuK7/zHM
 vbiQ==
X-Gm-Message-State: AJIora/uTNEsPoSeXSxF/nEtJuawpo7sQyJeFjws6S0TJlB93ykLK7A8
 BFzYiX4IZjDRm3nHQyz83d4ymA==
X-Received: by 2002:a17:902:8ec9:b0:168:c341:847e with SMTP id
 x9-20020a1709028ec900b00168c341847emr40310173plo.170.1656991450179; 
 Mon, 04 Jul 2022 20:24:10 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a170902d64b00b0016782c55790sm21973924plh.232.2022.07.04.20.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 20:24:09 -0700 (PDT)
Message-ID: <4adabd72-b975-88c7-aac1-11841d31e9f3@linaro.org>
Date: Tue, 5 Jul 2022 08:54:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 35/45] linux-user/aarch64: Add SM bit to SVE signal
 context
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-36-richard.henderson@linaro.org>
 <CAFEAcA80YR_jKXqW=qfVBFgd_FG9ZiMiqLs29Njsw3jtXdSgxw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA80YR_jKXqW=qfVBFgd_FG9ZiMiqLs29Njsw3jtXdSgxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: KRcS5ycdAhJa

On 7/4/22 17:32, Peter Maydell wrote:
>> @@ -177,9 +180,13 @@ static void target_setup_sve_record(struct target_sve_context *sve,
>>   {
>>       int i, j;
>>
>> +    memset(sve, 0, sizeof(*sve));
>>       __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
>>       __put_user(size, &sve->head.size);
>>       __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
>> +    if (FIELD_EX64(env->svcr, SVCR, SM)) {
>> +        __put_user(TARGET_SVE_SIG_FLAG_SM, &sve->flags);
>> +    }
>>
> 
> The kernel documentation says that if this is set then the SVE
> record contains the streaming vector length. Does that happen
> automatically (ie vq is the right thing for both streaming
> and non-streaming) or do we need to do something there?

It is automatically correct (modulo the typo you found in patch 40).  The two helpers we 
have are for VL and SVL, with no direct access to NVL.

> I gather that the other half of handling this bit (allowing
> it to be changed on signal-return) is in a later patch.

Yes.


r~
