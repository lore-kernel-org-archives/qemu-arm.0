Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp271399ejh;
        Thu, 8 Sep 2022 05:00:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR42NZLHNzLuV8nttOkScezqllAeVVWfbR77AqgqVHjvH2+xSgUKv4/Fs0RNZW1oDZy/b8ox
X-Received: by 2002:a05:620a:2956:b0:6bc:5144:1260 with SMTP id n22-20020a05620a295600b006bc51441260mr6049285qkp.181.1662638426710;
        Thu, 08 Sep 2022 05:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662638426; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBoXwmfdXY/Z5N2s40nZHsg2TlWTr4ROm9dgw+0K8y7QC5IcR7ikeAjrQp7eq2sH2r
         DyQtxwPVCPzjSnfDgV4r+4IGWyYMDPhRPOQXh49MIAlV4+w+dT1m73O9GReRm1h1jAhp
         kUDYSgyHpIN4SxRRuFlvHRXUQCKM98iRegfLhrngOe/NcMWskCyOLN/bXYayu7D1QqIJ
         bb4409Vm4gePeeGmsgRTHJmUtlMmIdHQGJm9UtZaRJh90AC4Cn9+ujBE5ZwUpEBbBSz4
         3yZ7b25lAVVuZry7wjGSx7ogdBXhT5XSinYQNndU/n3AfaccIfbwMxaq7JXV2aixwb6P
         v2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q4sLTEu/0ca8zDCXn0C919xAK1y9Jdxcu6L7R3XfDo8=;
        b=JgNUOznE9Ku8BSlzn1pnflLk1QjMv0TOEzp52tdkUDUybKPRGLSgJ+sO0nkRbOnfI6
         A1QjSSZdMFNrEbTNggrRFXe2YZBRhN9KfTehliqSRZykuiTY0spkQG5i+4Q46W7bJTwl
         hXU7eQ4dIfoY0E8YAFWN3H7BSFjSwIJ9Y8k8X3iY15auuzxy3cuZ/rCZvzUFqeC7TMa8
         IL1DXJA9w+wrfKG/ZW7HUBhyYlkkS8WF+RUm3TudGI8DJLaVOepJFIVTSy0waGJ3P/0y
         rflurkrZgCM1d31IaW5W6z+RWnkPrBJOKqSEQH/EGG1Sb63Rmbiv3wlbCzy5xsRRGPBa
         fuqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kJUKqUDa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4-20020a379504000000b006b8d35bb0a6si10000783qkd.506.2022.09.08.05.00.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Sep 2022 05:00:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kJUKqUDa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oWGCm-0004oR-Ui
	for alex.bennee@linaro.org; Thu, 08 Sep 2022 08:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWGBw-0004nv-Go
 for qemu-arm@nongnu.org; Thu, 08 Sep 2022 07:59:33 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWGBv-000226-0p
 for qemu-arm@nongnu.org; Thu, 08 Sep 2022 07:59:32 -0400
Received: by mail-wr1-x430.google.com with SMTP id n12so1745283wru.6
 for <qemu-arm@nongnu.org>; Thu, 08 Sep 2022 04:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Q4sLTEu/0ca8zDCXn0C919xAK1y9Jdxcu6L7R3XfDo8=;
 b=kJUKqUDavxUD6VDqkXbvPwR23DslIsjgr1rCdr8Vq2CEqUkR4gwRI3dhnLcN/bNz+o
 p4oSlkhRps2VHwGBDoFUi0TcU5mWRR2wENKyJTYYK+JbrZMhKTt6bb0PVyCXB/nwm9QB
 mQeTyzx4AekZBFDlecEH1OfX+JOpvlx9K1HmNUxHwy0tB4wcsSNf1YHNhnVZT+rnK02B
 rRD5LXxdvBBvEIBXB0H3ctbvMVe+h+Sl+xIy69CTWvAelOR8pvd95QqYg73UW/zGJOlX
 dtmDioN48WlWDO+23NxlYoT0wSGSSXCAKpkh75OnKNw/abPSRCW+pPBtiopGBz+dZvRB
 JvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Q4sLTEu/0ca8zDCXn0C919xAK1y9Jdxcu6L7R3XfDo8=;
 b=jIbZKcepmOuVNSuR/+4e0379XZzxKa7qjIVS6SQ0+m42g4WIcw+I7WHRb3eBFxrS0a
 p2r+5GW8K9tnec5KaMKKJoOA6uf3Fabp+xdJSAlklzW5ZdAbl1zf8C+MJZtpfJJc5nS/
 kyQadYg0FHgol+eRDp9Dr4bqRnj3tNdzk2xV+ILveTcmykHyw2fg8LDCaMd6+pIDWgaA
 YAZ57c0Mv7AZH2ilRj5hlaxzkoX9P2ncsmGm0Buj/05SlTSRWX8U4gipMqcJt81dR85N
 emoE4M3coAwgdcdbI7+RzL9EnlCtegO3+04yo+nczwXCO39O8nzOGJWug1N9vYKclo2V
 66KA==
X-Gm-Message-State: ACgBeo2t32fwfcjIDcZ1YakFB6UvvYG45tvEz3GKldb3ITb8UyG05/pz
 D0YY9IL7o7PjRl3b/kocV0dZDg==
X-Received: by 2002:a5d:64ed:0:b0:225:11d4:76d1 with SMTP id
 g13-20020a5d64ed000000b0022511d476d1mr4820987wri.579.1662638369339; 
 Thu, 08 Sep 2022 04:59:29 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 m123-20020a1ca381000000b003a83fda1dc5sm2555864wme.44.2022.09.08.04.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 04:59:28 -0700 (PDT)
Message-ID: <f96fc511-de91-5fd6-644f-6a4f9575850b@linaro.org>
Date: Thu, 8 Sep 2022 12:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/9] target/arm: Change gen_goto_tb to work on
 displacements
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-3-richard.henderson@linaro.org>
 <f8c471d1-7f4c-e491-d7fa-1df73aedc20b@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f8c471d1-7f4c-e491-d7fa-1df73aedc20b@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
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
X-TUID: 88l0SWDUMD3m

On 9/6/22 13:52, Philippe Mathieu-Daudé wrote:
>> @@ -1399,9 +1401,9 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
>>       tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
>>                           tcg_cmp, 0, label_match);
>> -    gen_goto_tb(s, 0, s->base.pc_next);
>> +    gen_goto_tb(s, 0, 4);
> 
> Why not use curr_insn_len() here?

I guess I could, but it's always 4 for aarch64.


r~
