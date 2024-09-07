Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp486835njb;
        Sat, 7 Sep 2024 13:19:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmxqPYxXoD0dcIMR6n6DTbrhxv2ZW0wYt8cRA3gaSgo8I6GZj0h3DXCWc5HzDqlFjARAz+bnijBRkdiA==@linaro.org
X-Google-Smtp-Source: AGHT+IFZeoO9om00n1HzoFwfkOHv1ldUwblT34coKDagN94bLsHyN2I//k32i/lc1ToHzrYNXUFu
X-Received: by 2002:a05:620a:2486:b0:79f:b0e:2e70 with SMTP id af79cd13be357-7a99738860emr705831685a.55.1725740393923;
        Sat, 07 Sep 2024 13:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725740393; cv=none;
        d=google.com; s=arc-20240605;
        b=Wxq6572NRds91LmgqzxEpo1qhxSBLgG3Qylix939HmsLBh917DxN9bGOoIud+PINtn
         Qln57kjOUbAmSWg8+e23iDMVjXUYFuA18n+YbkzUiks/nudi43ffYY2k34JZrUL4u6Kr
         N9b1Jy9TRbvVGJCPYGh9fGFjRtnoxlYOU0PLCKvM2nvudXn1q5d7DDCkT6Nw/j9yFh6l
         zPEQXQvIT1yQJCYmKOZWGRzgzk0ELBHyw/bDoOFe2a70Rr/h34D2+7Uf41MtZ+t+AzqR
         bhg3Du1quZcglrD0/FFRtXTHx18UGUXLPEmCupwq7KpUUAvFeVXhf3rSEmffKf53hHE+
         7h5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ugbFvJA++7Bx06/tZMZ7lkyfp8yZY0lO1Jeemd7S9jM=;
        fh=whZIJrp4JvrY9sggMs/qBcCPmJMsDp5azf8ORR30Vi0=;
        b=VDwOVrLDGHg6RxKGvWxW4n7CWY5DHpsM/ki6K5hA8fqhxqAbd3ubwUd91o/2Ka8XZa
         i+iDCXf8B/XuSnUbv8aSQhmr43AEx6AgVRkZSSF2wC3C+jclEi/9ONHTHugXWCxN8Knb
         YKVpvYGzYlHOaEsSIDKZtf9gMjAfSM5qY4Vt5BGtsyfuVQsPNQO60UDZZ2HLPEcy32AQ
         5+P8q8S9SEf0xdgX9XEb4ZPJtUpWu7jDJeELIBAA10159qGJftpoSopb5dCliDkF+lUn
         Y0U1FfxBOuR8KJZKQPBRctjISHyXaHAeJFcvlTccUwIGhytrhy3eQ6etfnNqAmzXYqp5
         JNVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VvNUyePC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a79c6b03si193400585a.115.2024.09.07.13.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Sep 2024 13:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VvNUyePC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sn1uG-0003UT-IY; Sat, 07 Sep 2024 16:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paskripkin@gmail.com>)
 id 1smzpP-00020r-Dn; Sat, 07 Sep 2024 14:06:31 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paskripkin@gmail.com>)
 id 1smzpN-00027b-RL; Sat, 07 Sep 2024 14:06:31 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso5221980e87.2; 
 Sat, 07 Sep 2024 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725732386; x=1726337186; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ugbFvJA++7Bx06/tZMZ7lkyfp8yZY0lO1Jeemd7S9jM=;
 b=VvNUyePCPhO8svJV64w4KNXGeOUrKR/I+FC8YkrkOJuRKD9pEVcucxauKgojdIGAaM
 dbqDcbXBrV0c6Wm1BxcDQ+NnHrHNnFWAVSF+piOpUjFyR4Oia0PGU2Fu/PJlSMTaw4T8
 3XabCZCFmSlFQ4lP/ZKIsGDqauZPtMrwGk2EUk5n8sS4EvOGoEts1rls8mpkpbI2EbxY
 N7Gsl4eRM/5L300RfZMRTKLbUtBGUplZHPpR34n8HTsKJvrcpEtHLbL7eOHxvOFwQRWd
 D5L9Q+xdGFe5Yyo6J6Mlyr2bqgdFuwEsGams7eMdyHUmj3LgTLAOAqcZVyvrYufBzoTk
 0VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725732386; x=1726337186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ugbFvJA++7Bx06/tZMZ7lkyfp8yZY0lO1Jeemd7S9jM=;
 b=bMmU3FLVoFXGGLSgSXhj1LwBEVUjz5cluKG/uYm7zQwSF1Jz+NvCkbinzAEM3Pj3Be
 Br9IiTGV2/aKzb+zmqfJQnys55SFHiww7Mj77JLYhhABUyHsqZsgWDASHyq5lq0yLii1
 JIuIyi4mVZYQ3AnZ86TgepaNdFj39MX472VcN8LZV4ojLL4xeId+qO5ThdrJAvDlh+CL
 fih0H2oQ46Xjo5l/qcYT1oGbOPd252KSV1qzGhdNcltgXWy5gkIli7Zj4n5Ng7z8jlqZ
 27HQgJfaSYeILtFJyJg+4f5AF4iZsEMr3S9AiH7RDKtbUXWJMyTRhEa4ke2OL2MjOrr+
 tBDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWtzD5of9f63/Zo+1P2p4in9y3aK+DUYCZTE8B+60pc69AHj9gK0bWjV+IrG8bCRYzENsBCKYsJc16Tw==@nongnu.org,
 AJvYcCV58KHWxju10EJPIoWPyeyo+iv/3lhfH7AN++rW/we9jOLe3RRHcTIF0zKE1w2qwH3F5EV189btN8g=@nongnu.org,
 AJvYcCVFS942KLmWk3v1C4xi5+GHcSEEoMnasec4lGM9T0XXxYiGDH2OD0iopiDzRvWF/HbZkry+0g0PDEwmQA==@nongnu.org,
 AJvYcCVg3veLxNOnNoxzseiJgds3NVTN+pfpvoY13xUiN9tJCDp9M5dY8btoZQq3+PTFbJnYwnZz80Iyki0mzQ==@nongnu.org,
 AJvYcCWQX9Q91TKtqGeUuxO2jGghnuHf5cSCmSzoer3cArHIzV2b5goRmbhqbiOKGtOL44CLY9BNA7h2ZQ==@nongnu.org
X-Gm-Message-State: AOJu0YyaGfTxWK+XgJTXben9hhsKB3nrqS1ylVskiJxcBrz8ujnf1mf7
 156fZIIFuPS1wxCyfCeepT49KrTs1S8EIAjOdy/KT0BQsXU1o+oA
X-Received: by 2002:a05:6512:2314:b0:52c:e119:7f1 with SMTP id
 2adb3069b0e04-5365880c4a5mr4115105e87.51.1725732385495; 
 Sat, 07 Sep 2024 11:06:25 -0700 (PDT)
Received: from fedora.. ([2a00:1370:8180:9f8c:f275:da53:b6a5:dda1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f8cac55sm206369e87.166.2024.09.07.11.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 11:06:24 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: jim.shu@sifive.com
Cc: alistair.francis@wdc.com, arikalo@gmail.com, atar4qemu@gmail.com,
 aurelien@aurel32.net, bmeng.cn@gmail.com, david@redhat.com,
 dbarboza@ventanamicro.com, edgar.iglesias@gmail.com, eduardo@habkost.net,
 gaosong@loongson.cn, iii@linux.ibm.com, jcmvbkbc@gmail.com,
 jiaxun.yang@flygoat.com, kbastian@mail.uni-paderborn.de, laurent@vivier.eu,
 liwei1518@gmail.com, marcel.apfelbaum@gmail.com,
 mark.cave-ayland@ilande.co.uk, mrolnik@gmail.com, npiggin@gmail.com,
 palmer@dabbelt.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, richard.henderson@linaro.org, shorne@gmail.com,
 thuth@redhat.com, wangyanan55@huawei.com, ysato@users.sourceforge.jp,
 zhiwei_liu@linux.alibaba.com
Subject: Re: [RFC PATCH 00/16] Implements RISC-V WorldGuard extension v0.4
Date: Sat,  7 Sep 2024 21:06:21 +0300
Message-ID: <20240907180621.60916-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612081416.29704-1-jim.shu@sifive.com>
References: <20240612081416.29704-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=paskripkin@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 07 Sep 2024 16:19:37 -0400
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
X-TUID: /1HVsEgX9wQD

Dear, Jim Shu

Thank you for your work!

Do you plan to work futher on this series? Seems like current version is no longer applicable to
current master.

Also, I really wonder how did you test these changes? Like is there a way I could build some binary
and run it in trusted mode? Should there be an SBI support for that?


With regards,
Pavel Skripkin
