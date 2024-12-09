Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2867360njb;
        Mon, 9 Dec 2024 12:37:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNaZUINmbDjNtSiIxnaIJgbknbG8X+PeqDXTOLL6YaKeWXA6/4qb/68bUBP13u1V6jRC4sC9zGSVDSnw==@linaro.org
X-Google-Smtp-Source: AGHT+IFnT2rly3PoA7qCGNcR+YcvPWqcVVayYO84CU9t8rcv2z6ACQTKheaYZPu4UU95rr55Wz96
X-Received: by 2002:ac8:580a:0:b0:465:2fba:71b5 with SMTP id d75a77b69052e-467752573b8mr11525711cf.13.1733776640815;
        Mon, 09 Dec 2024 12:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733776640; cv=none;
        d=google.com; s=arc-20240605;
        b=TA8rBKIPaslNfR++YdQCtiOhpZQmfmk3IZNOAI0fk+TXQRQpS2F3FJeRDOjGszVkWx
         oUjHcBiIDznDkf4WR41YrI4KrtI1CSV5Q5K2U8AAIlsArx/ewBXxqAyHOn+XdIyu1S+w
         c/syiZ1pODyWfDaSTcvPyYZPvKyijn9fQVhTfhXwwnbQpW/XLzU3G3m2aNVixzrs7Yoj
         FFElgcXUozCW6E2DmY4ZrW7hijmLfouFZnotQiRl3Zxuac1o4oKS5H+FW+VDdhl6ppfC
         gjGipZKlYpqRyBrDtkMFdXc2NiClAs/4DuWe65EC09W0CS5Cpp/oadjsp89RpWEHC5Kt
         jppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qYKrY4D89CQtOtQV4UE1A1McnS4pHYxVCom2HH+qHOk=;
        fh=3DUKDZFRqiDt9xw/SjfimG9WWDbgqRfQkmzObEhd+nw=;
        b=ExsIS5rASB96/Nj75F4GmFvtUhvFDwXaYqOtM8TxY2zvClj37JdHV5A5QrAgwM0Ug7
         UB06A1hmhv+GbObgo0kqYwfZ4xQ/AkTQqiKKJghUw1h3LfK86d3kwuZH4nDAi2aqtFR+
         SAkSvSAFdnvTTRRPW4aBvZOAk6jnoO75/fV5rgMKksm+pu2a778USLqABCPI7IxMiXBY
         Fb1ZSI+V91b2ow6yLL2Wc6tePCfF5kymHsFhFfGm2tqwJHkAQm5uiFrq5EWnKtwMj1Wy
         8bpEFo6s1YbGy3BjAmpAp9iDIDUnMLqUqjoWkKPAiXRgXVlQ27SFzmxnWBIs2uP0lTG2
         1dMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=bawufz62;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467298434dbsi120495751cf.635.2024.12.09.12.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=bawufz62;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKkVB-0006HT-Tc; Mon, 09 Dec 2024 15:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV7-0006DU-Gt
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:37:05 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV4-0003D0-G9
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:37:05 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso229204466b.0
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 12:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733776621; x=1734381421;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYKrY4D89CQtOtQV4UE1A1McnS4pHYxVCom2HH+qHOk=;
 b=bawufz62s0+B4u9giuELv0ftic9R5QPCb2vQLlmQbYw7xLIo3VVyVSYOKkjLGmZlS8
 fl7RtGD+uyTBRnFBfcbqnOhysXl8rSAob6I/vFRMn+XwI4Ts9xt/TM0GLeZ6eREpceu0
 LufjcdwYGp79Kk1AcwVeTWKY705uodypdQVYL7m69IIJaBaBErgqj8Bhmlz6i+Kka87P
 hnovsxj7AM2kw3RxX6V/a0IJGmOrxlwPgwg9TWT5LLgQYmLQbr6lx4AZPtEQhG3tIB+D
 CHAcAMyIUnSpBW5tVbA183tDKK74AZM0Flhh+elqSbMXGPsuROg4VwoNai1tyz6GTOPw
 8JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733776621; x=1734381421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYKrY4D89CQtOtQV4UE1A1McnS4pHYxVCom2HH+qHOk=;
 b=oE5Rd6V90AmiI9m9FBzNH+E0c4wHtR1b/EUxJUPlTR9Wmjdq1h8L+RBD7aca3wvBWg
 KIcuqWag8F+mGJt3cWwyuqI17qHn9ti3u6km3Fp3wvHc3v3d/xm+naE9wXbFip4S1dak
 /AJ8RbyALZ4Evq6qEm9NEim6hlHlxZOWn5e2Dvzwv5EBSbsy12zTja51UmXnxHXhEbkf
 IvJgMpJwVA+HtpCVwmESXupfvwzhLQtlXPYEmnGtVCdMzt4bGMoenRABzSPXPWYPjEeT
 F9AFVCFbcDRtjnUNiJUZ9u1awl7TgvOuA8hRVqOZPLYX4VFHlrsB7S1198NKL/SewG3w
 WGdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWnO6rxR9r0Jbh8wtG8RUBx18wGP7fHC7G/p1c/qFwjlYCiEI6hBO//3KV+kFO7eg28WJzEEP4QQ==@nongnu.org
X-Gm-Message-State: AOJu0YzCUx/8eSfxKcQCb5Tz5SC/8S9VSILLAkZg1/PAaZ77Gu/mF8rS
 bzrM5j3Zsfx+4g+Ab0nqo/NnIx5OcVr/wo5SbxP008dmPcKFOA61vh84zHdujw==
X-Gm-Gg: ASbGncv5vqm+JL95t5aAUnve3HZvCXqHe3jVS6ixDPHsxV3suVdYgcUCkbExVm6qYBq
 J8UZw7ffarjgC+nla+RzwPe0G8G1p2c7xZ6uxbdSwDdEwd3y+GPFSgtu1bew2Xh7nWoq3Jo045C
 VNX5/5NVznzCekxuTYsPBJs+NGkPCjDAZFILEvhU+/MhJcg+hhPQLFxaId0I6WsSHq449Fost5k
 fcnBsOVyekDq/Tsmi1VN3nK133Uyx2gyCsIZmsllpFBh1+lcPsE2BSqSi0Ir8wjkDuoFs9tF4dj
 YPte8sawykydjoaJ5ffh7gyoKOgtWw==
X-Received: by 2002:a17:906:8455:b0:aa6:96c4:ad58 with SMTP id
 a640c23a62f3a-aa696c4ae47mr307131966b.61.1733776620739; 
 Mon, 09 Dec 2024 12:37:00 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa692e4e9d5sm141783566b.129.2024.12.09.12.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 12:37:00 -0800 (PST)
From: phil@philjordan.eu
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 03/11] i386/hvf: Don't send signal to thread when kicking
Date: Mon,  9 Dec 2024 21:36:21 +0100
Message-Id: <20241209203629.74436-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241209203629.74436-1-phil@philjordan.eu>
References: <20241209203629.74436-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::635;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x635.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: Szyi/ncdun6g

From: Phil Dennis-Jordan <phil@philjordan.eu>

This seems to be entirely superfluous and is costly enough to show up in
profiling. hv_vcpu_interrupt() has been demonstrated to very reliably
cause VM exits - even if the target vCPU isn't even running, it will
immediately exit on entry.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 target/i386/hvf/hvf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 3b6ee79fb2..936c31dbdd 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -214,7 +214,7 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
-    cpus_kick_thread(cpu);
+    cpu->thread_kicked = true;
     hv_vcpu_interrupt(&cpu->accel->fd, 1);
 }
 
-- 
2.39.3 (Apple Git-146)

