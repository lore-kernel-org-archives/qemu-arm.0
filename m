Received: by 2002:a05:7022:6382:b0:8b:e46e:3391 with SMTP id q2csp740406dlq;
        Fri, 4 Oct 2024 23:13:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1XNOg3VtJ2KOVyq8mVjheBBDYn7DLAOeeFyO2FUDAgZYMWj2DHEddtCdpMauKbkQ8JvR01j6zQ/H2rQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF53vWTSiHj7LENUccPTqpYWnpai/VKqXkMR3t4rMuvoCAtyzGuzhe59GXWZEpHFqZTwhJm
X-Received: by 2002:a05:620a:1988:b0:7a3:7920:5500 with SMTP id af79cd13be357-7ae6f44c766mr878299585a.32.1728108826563;
        Fri, 04 Oct 2024 23:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728108826; cv=none;
        d=google.com; s=arc-20240605;
        b=iIu4pFjXPrQkwGZYb+ubZLV1xES5Fm+oVMyax8jVbvHgEgVvyN2XYimvdXk7JT+cKC
         GyL7Y3IJG/6NNrhnJrNDbBtuxt6PXOn/ewtuohvXkIorvUu+Eec5PLmRuyDQIcia9qLY
         wNz/8/IR8oB4wla9sBDxseUR76tIZp/XTa3Vf11lU6ELbpGoNZM7sJh1+kU63ZH28xsA
         knR1D3iHALn85PurwnuMgkPRdsNdSfJ8kSEvci8v4GBgzcvearMSmK3qcEK0x2jUKECd
         3r6baf+gHxNoNAG1OtQCtZwH4zMLWPBS5TICir/5wiQtYmXsmfy5z632rTGEuCk0/xqB
         Muhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=K47UTTHt5tS3pAusc4ANFv/1D5/pvMB4vNe1vE9RjAc=;
        fh=OkkyDpHynflzuj9YlSMg5QmpfTJGgfxmln/UMJEtbwQ=;
        b=egaFNtgbzO6vUN/1ZQT1yleN9+Z4VSyML9ciBsdWLtjM38qD3Ezq0LR3nvI4QDIYJR
         udJStcuBuQBr3m3Nh8KaRQ+TW0JMf4WRzmXebJQ+2LJyqBmID3Xx+GwGNgmqXXgAzipr
         7Fnd2lJLZwqbKKy3FoODwj9g+71z6kkDEahSxNLp3R7jiCF+XnzZvbDn+OBtGmA79aAV
         X+W9ez1Yz04dRdmabxih65AzHVEjJWOjCGBWGLERT5SA7MRA7L+5CD0nh6NfluVMjBCW
         ivCnxa6cysq3DI2IrEPeOVkh3Zrwkw09JDD8nMEH7eFuZwp3xpbiladPUzjVW6wmE2cC
         JPvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=rydWWXS1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae757735absi124391985a.635.2024.10.04.23.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 23:13:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=rydWWXS1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swy2l-0000Zg-Hy; Sat, 05 Oct 2024 02:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swy2j-0000YW-VI
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 02:13:29 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swy2h-00016f-Kj
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 02:13:28 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-20b90984971so29739145ad.3
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 23:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728108806; x=1728713606;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K47UTTHt5tS3pAusc4ANFv/1D5/pvMB4vNe1vE9RjAc=;
 b=rydWWXS1BEHP9GSF7lrfHf4sxL5/cBX3XW0fNs4C5cwDOOSUSlCyGqMG9ce/ge8Hqg
 wNSDtYqE9LAmJNNNsVJOGm4PES14+n0MZ8+hsvYYiWU7mDEQ3ZRCcsQf3xdpD1JwEjWL
 L6Fzx/1idS0PIB61spocsmWecueCJRcjzocHSc4mlWlaF9EetzAnrO2HD3BGI4/GE96X
 guEZVt3I4zarG9XqwQlEZG2PKFZ/TIf5GA1TMFCumDDEr2RFW1g5a6zqbdD8QCvaTqFN
 +Z1Q1QaffFI9k1V665lIOYFadvNuMac6AjkxNAJTtfd74Et8v4yM7O/CE88Px3WvWhdi
 CZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728108806; x=1728713606;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K47UTTHt5tS3pAusc4ANFv/1D5/pvMB4vNe1vE9RjAc=;
 b=S5mZObihg4roNYdfh0I8cvkOtprm5J5+i43FIhsq6foMP38fRTyJKpbY2c5c28lvfj
 +2Vd+KshlJXNqPq0uGda2NlszAi/Db0ksreVoeXRAXhi47U61cTgQYs6w3iz/Vq3moNH
 ZVSb919D1uVwarY57j1yJ5Sg/Slkl18Hyzs6AsqM3FY+IPhqMIev7fif3D8RRzKXnqXF
 +7EhA0o1EezwsdqHyq3ep1FzUMTlSIdNK8whhJwZcS1JYXrIHyqo9U3o6NDT6GZq87S5
 wX9oHD1ahEBpdvGvr2RrnpW5fqpC9BGnlxuSPu4EcXnCF84RZ/ssCzKDyn6SAiLwshfN
 8x0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI5YtWYaTP9sP8KonG6MbeU69PBbP/kyX+NH+YWKi45rLIoG6Z7l8xqDdhL0nysDGpofG2yeRwxg==@nongnu.org
X-Gm-Message-State: AOJu0YwkT6Fsa4CBmat8vzp8pOubeTsSntZozTBJffHpG9XrXsWyUnRt
 +ceCQw5FoBKasIqhkZ3Dhi4rkpbnfAIvWj2FNNrjQYMdVOVe3JrO32LMzDVCZ+w=
X-Received: by 2002:a17:903:2284:b0:20b:5df8:8c5d with SMTP id
 d9443c01a7336-20bfdfd1221mr66607725ad.22.1728108806216; 
 Fri, 04 Oct 2024 23:13:26 -0700 (PDT)
Received: from [157.82.202.230] ([157.82.202.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c138d0b50sm7428975ad.102.2024.10.04.23.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 23:13:25 -0700 (PDT)
Message-ID: <2be51c78-a9c3-479f-bb87-3a4c0ddfe58b@daynix.com>
Date: Sat, 5 Oct 2024 15:13:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] hw: Add vmapple subdir
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20240928085727.56883-1-phil@philjordan.eu>
 <20240928085727.56883-7-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240928085727.56883-7-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: QXQVSbBlOxYn

On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> We will introduce a number of devices that are specific to the vmapple
> target machine. To keep them all tidily together, let's put them into
> a single target directory.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
