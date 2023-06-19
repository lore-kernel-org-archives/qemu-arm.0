Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2738374ejt;
        Mon, 19 Jun 2023 03:48:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5++DHXgSwsiaTdQ94vLffI8nClii06KJzf9flFGk6EaxQXjORiyyIU4pycWKu3SIM8HuhS
X-Received: by 2002:a05:620a:3e8b:b0:75b:23a1:8316 with SMTP id tv11-20020a05620a3e8b00b0075b23a18316mr8195349qkn.17.1687171687539;
        Mon, 19 Jun 2023 03:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687171687; cv=none;
        d=google.com; s=arc-20160816;
        b=Io25BLzd764pMIcRxxol12ERDUWuvzd3+BJ/fTRj0Nt/h5jnsL5GG49LdIL35YQlUS
         DIkneBj7dvaKgsz6qaTfkma8UF5k8uimePGIuMEYzFHbjcSzLtuWskOUZF5sdt5UnjRo
         zP+d5E8F02/2Zjk1xzjAjeITp5kGP2H+DA0Pm6lt/nl1Wq1qgY+DAOVE3sDbuf8QG27w
         +kW1k2g5gEAf5qSlMSK+bv1Zb7Cl6ACmJEfvyYWlpTGKhFsgiJqrPUZKmrnXT2ioczVM
         TNwsVjfex4mOkUvLUt+7w7umHOCMhYUNYaj2AFmB+ECfv3mdl6U1PhQD3KlgrEsdFV/e
         cuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/4KnMySEsdJGciUBevgZoZvi7GHm9hAdbVzOKBvHIr0=;
        b=po7MuY8OFCJkVCyIWIVxcikBynnWMVfr0EqXxnwCyIC9ycMIZYyOON2ILqXwG6jcfd
         uQ1ijdrLqTRImp0Dxm9RwJ9hArBowQt0sJvnkTeejB+upvsdCQoq6SWGBd5gf4S2htDo
         imwX7V856KVGGsyUwGB761R99m6Scqx5o02495XB/Yoi5Nw7MpysOT41JXMVz1gFskP3
         P+F9e56/6MwFwaGRycUVKm2QDk01q6Bsayy0Ty1x3pnCC3NDrau12MNqC0bosgXO23t5
         i1G7SrzU23XM6D8ATeIs43d4rA5Zgu6g4oXjqQ4jlD1ZDxcuBeiktMA6oPletUIsIYZl
         qq2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PwIWnr00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ow20-20020a05620a821400b00762383c4c4esi3097583qkn.453.2023.06.19.03.48.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 03:48:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PwIWnr00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBCQR-0003vL-Bn; Mon, 19 Jun 2023 06:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCQP-0003up-Td
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:47:57 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCQO-0005Km-4v
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:47:57 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9786fc23505so397899366b.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 03:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687171674; x=1689763674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/4KnMySEsdJGciUBevgZoZvi7GHm9hAdbVzOKBvHIr0=;
 b=PwIWnr00LbLZlGe8rdr0f/gKIAlm8Mr2dPb94U0RU2QC9093k4IkKP4/jkd1jLmwyg
 lxGyCnCpw22lJZazWVjf6MSm2yBzQfa6NLXqJB5ShuhPKCsiLwrqqqajpSl4KTZ1p1UU
 GrakDSew8IEvmMUisNoxEgXqldV/NOl89DbB9rWOgT9/isqWcxW4j+O4roHZ2iSvUBwp
 ESyeVBcTC5xOL81JeGg95t24ws36AQUc3UDMnkulwhU96fnVkrUIowU8sxdPg9q3YMlu
 mo4oizytyHl6OOf5KSxCqvQ8rJzQkEkoFB7dp4Ftq53oEOjTiAUKYhGCyRnAkdtUBZBY
 xDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687171674; x=1689763674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/4KnMySEsdJGciUBevgZoZvi7GHm9hAdbVzOKBvHIr0=;
 b=SeKo433RHKppztE1ugjYCZamBDKTDKXuuKC8M5aYgYnjwWzCPwuF+9HsgQO7OpdUsT
 LkBhHGDPzmpy6MYVDpLGKBRW2qK3iM+lgCL0hMMcQNavCpMHBnbqOB/hSsF3WmaVXBdT
 ptdamtwZcgPXpCAQRJtSeOt2lU4IJVdXcFitqeldmR6yRIrWQr7dYfSU4B8ow8oAWTs/
 4MhGR5MjGQKKVeLt/73ZGTTiZ6vAiNJq1POwjVDJz4zoF+gO5zjAqVszswV42SFqrVYN
 Xd1UePsywTqwEXe4iqnSShI21VESRGIQGnd8WmlQQoshKxDN9rse5Xif7GwKZoaR+3Up
 WBIw==
X-Gm-Message-State: AC+VfDzF/uSgk5HTsTz3nfcc0PiNR8g3bxpC9py9gM3Y6zILmQtxnIq2
 8SXHpDRPehy7mXNTgPrvliaIQQ==
X-Received: by 2002:a17:907:6096:b0:988:9ec1:a8c8 with SMTP id
 ht22-20020a170907609600b009889ec1a8c8mr1811565ejc.54.1687171674607; 
 Mon, 19 Jun 2023 03:47:54 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 gu4-20020a170906f28400b0096fbc516a93sm14470950ejb.211.2023.06.19.03.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 03:47:54 -0700 (PDT)
Message-ID: <3dccf713-e5d7-5e9a-8704-bec1812669c4@linaro.org>
Date: Mon, 19 Jun 2023 12:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 10/38] target/ppc: Use aesenc_SB_SR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZrFfF0BwB1/l

On 9/6/23 04:23, Richard Henderson wrote:
> This implements the VCIPHERLAST instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/int_helper.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

