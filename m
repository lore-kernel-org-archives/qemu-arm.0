Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp251815ejk;
        Thu, 30 May 2024 07:11:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqYKszNZmWEHIwY1SJnkOn5CHO2Llnr7mp6gotxj/EzKw/ivBCLsHIfyN0nln/r9RcMUwP1TKjc69kC8jWtccfyNiujEmB
X-Google-Smtp-Source: AGHT+IHFsmrM6iG6ZL+rt09o+IfuDAm94U255r5r1Ln569foJ3bYJejIaGZbJ0x0wuv45Kh/t94W
X-Received: by 2002:a81:d843:0:b0:627:96bd:b28 with SMTP id 00721157ae682-62c6bcf92admr26748797b3.46.1717078264879;
        Thu, 30 May 2024 07:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717078264; cv=none;
        d=google.com; s=arc-20160816;
        b=qIOqX6vIFki7VCK+IHbsVkL2IscszhJotURzX54jPLjxqtmIroQ35NwKKRQn0T/+5M
         vslwj9rvTGaCkyhEzS93AKkUnDu/7VA+G330O6zv1p2eBC2upexnAj6MJ9+Txf49Hvx3
         VU3YAJmgb+5UEAsccbG9aCmvz0ejjrKqjjs9KlmbCapEiyfrNHTUMCxKUrBq/9E24kIE
         kMb732MU9lbK5qaOcnq499CBw9rtxaS+awYAwbanb6ujBJT8o/8GOg9/RwyI6u/Pqrmy
         ZIa9RKIDjq0GBXoyGJYj67cDGiS5Y2+hKxkGb8NgKiSOEIYudGojO3zhN2s1+9NfLjSP
         STpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=J3HiJGmtGWTq9v6rsVXPjYgN2PkJzGxhZSTfFS/QoXA=;
        fh=A+ske0Bat2AqbnH+eukWpijnqevEwiQCnJKlSPqJRJs=;
        b=gT/SOW2fbTEOBVtjy8N/tCJQg6HyktWhDMfbXG6V5Me1lBRGzK3RGK/4BM127OGm0T
         m5I/3V1NL97BCjE9O6wTKlcJLQGHTkBqdEmJPQkXp2ycP37yWtBbPIwAqDI+dsB8RkQE
         n02nVZBex8m5ej9JT4GK1hpdWEIDsD0wAWQ1kPHCzWzMKZ4WcrKq3NwscSI8GqxM0Smz
         nB35ahG5wIEbV3XyvsDnOrJH/Ftun8Ka3ej1bbMQYnKXEr4+oQD3Wj3ImT4Y2zkAEljg
         u7sCFUCNnO/+7qTea9LbTF8ecO+WNqMkrHUSMKNL1U5rOFwXIk0eldEYbaVD4j/UwjBz
         KFVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=to7wH+Jb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-62a0ce51b3fsi67490257b3.101.2024.05.30.07.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 07:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=to7wH+Jb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCgU6-0007qO-Tm; Thu, 30 May 2024 10:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgU4-0007p4-WF
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:10:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCgU2-0001Uf-E4
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:10:24 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so863218f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 07:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717078220; x=1717683020; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J3HiJGmtGWTq9v6rsVXPjYgN2PkJzGxhZSTfFS/QoXA=;
 b=to7wH+JbMwE+PPbCeaLTQncZDvZR8pNqT0HiTEkdhw9V8qzi65IIQzKg8eQ0/8WpBG
 YU/ETV5hTZRlX7B/KIs9Ew4mSwC3g8HCZ/kXGKSKYeEJ72RpZGb7bl63Rz4AQafLq/Gn
 8qPpKyg1t0XK34mFf+an0vKPxWSsDJCcJLTz0AHuVg1aL52FEMlPkec44pMzFk+BC4Z0
 rYpNu5XG654wAq7i9N7vM158kIYTQsroZ8szYBsOVJOflLYcl9WjwMxOCIxFxG9NvODT
 dbdCreV0HAaACQQTGBef/WAKgIeFDA2qypXRY/EsJn8F6rGOUAVaOBoPga/KJsig0zC/
 i3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078220; x=1717683020;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J3HiJGmtGWTq9v6rsVXPjYgN2PkJzGxhZSTfFS/QoXA=;
 b=KGeL8fx0Bhhih76EODRoU76RP2K7f2R5pHQcyYQyvwEso8O7G5J/RcMpr5YKqAYt7O
 2j+ytAKYbnowQcnl9ZCLfkvijvKCedIqByz3JOQvsW8qNIZQK7GLn9xIOoIB4RWSSCg7
 TyXdNs2kebBL003YQR4CP9ugeL/HYlOt/ixudF9sbBsG5iUnKtwF1NjHHNVlCkT/7jhd
 zVT5+Rxl2hPqlxhPxkH77B3Nr3Ga//nW9uI7y/I0niabVI3G8+eRF2EN8QWfpa0gGCki
 Hvf09ij18eOFcwsKvZQdetPGgxYsl/hS7IywWUZQnXztlSgeBkAxHLwKZ1cZHOUbfQry
 NbSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdVji2rOdMZUutIDHY+xWsViv/NPTbrad+5JlVpZIT9NZHMCLF9Cz43EjnNkX+60c5LfYgq9A8479+Bga8d6UoVQ6j
X-Gm-Message-State: AOJu0Yz4PwYKJUdEsHza/ZmqdGkLzDv9k21Xrd5vJfTsunG30+4sSSGX
 iDLP14Vbr2Kzyuh/HRShTPLEiF+NS3hlHJitwNwSICxNwcYyOi4vU+zrJNVQVdzfGVrBM8fEoBJ
 jMmj8RNAPcR5I5ttGgpfKWiIGORUZQukqOYjTvA==
X-Received: by 2002:a05:6000:d52:b0:357:39e7:33a2 with SMTP id
 ffacd0b85a97d-35dc009194dmr1571672f8f.21.1717078219856; Thu, 30 May 2024
 07:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240528203044.612851-1-richard.henderson@linaro.org>
 <20240528203044.612851-32-richard.henderson@linaro.org>
In-Reply-To: <20240528203044.612851-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 15:10:08 +0100
Message-ID: <CAFEAcA8Vok=tNa_a2-dwcrKHPdZ4qf-MF2jmkqcWKi1daJ7PpQ@mail.gmail.com>
Subject: Re: [PATCH v3 31/33] target/arm: Convert SQDMULH,
 SQRDMULH to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QcrZg4ZmHCEv

On Tue, 28 May 2024 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are the last instructions within disas_simd_three_reg_same
> and disas_simd_scalar_three_reg_same, so remove them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
