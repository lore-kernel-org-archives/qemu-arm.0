Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp401439dyc;
        Thu, 3 Jul 2025 02:09:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWhsbAh97uC44Az3Jv34w7EhklD/Mjpon9/VdTc6tIRgNtA0sARSiOyIrijhLK/NimzMGHdoZv4nO0kg==@linaro.org
X-Google-Smtp-Source: AGHT+IHvlbnLoLy3lL1UH40df0A0QNphuPDHo/0lL5du5QdbyxB8xKBIw2rE7gMdejCWI/4xw2gs
X-Received: by 2002:a05:6214:5001:b0:6fb:14:5e89 with SMTP id 6a1803df08f44-702b1a6bc95mr82223756d6.19.1751533757979;
        Thu, 03 Jul 2025 02:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751533757; cv=none;
        d=google.com; s=arc-20240605;
        b=HzDYHR0qT2ZRXnC0C9QVqkOOt6QuQd1+8DT5eExcyNwVvgR2swNWLa9JuURt0oRX8f
         rKK2z8JwZX5KCMpw2dOoNs9Syqk1bsm27VOf8qABGkEKZJIPDoGCvF8Epk7/PxNVR7Q4
         XFBhfENWjOSt4cnuW1rvzbOs5fVbSG4LmLAd77Svo+0Hp2DJzvFJMtZuLWdpDi0COVCh
         BaJnKE7rOb+ox8WlpO4+O8pWhaMyy0GNTsspJzibX0qzI1JVMp+GaVmSk2z0J1CdMu83
         EDliGFbUW9SWCwEv5LRSszkVepSJV8l/87UXpN1BmsFDYQIEYVd8N4Y9tdK03lLf4wTc
         7gBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ndLtpZNVY8qFyDjOn/xAexiIb6QRnZYtnSMwE7mC11I=;
        fh=pe8ctuRq/ZR/j8mvw3S557T4dK1HormDaTseeGAQzoA=;
        b=Pz+zB5kHlrnKP2Ef0rhW7238A2Gv4m1dgX0o4avucPtk07CJryWpmMWL3rPPkEOsE3
         wqz1UbBhmImm+f6BMr2JB2WmoyZzv/PTJoHuyC7rdbQz94AMqQhHKTlVMZfqxY7cNi4V
         6F+DaRJm8Hj8fiKzcPyZ9ybN8mINILmFl3IfeHxrxc8P+TDs0xtAja9qIYCNyknId7Se
         /IdVpxJk/tcox5xEYxDLV3JF/MGdf+9iO+jarUPQPbot8fFQbRFP1P14SPqybGDfjmC+
         8mzbkpAyVav8NnjpDkZCDzZqfzCUAQdxV3g0cnZb3MpoTzC3qs2JUxYZUwkPRcCtK39S
         deeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ruOIElXC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77389510si162650386d6.419.2025.07.03.02.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:09:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ruOIElXC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXFw5-0006VP-2A; Thu, 03 Jul 2025 05:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXFw3-0006UA-7j
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:08:51 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXFw1-0000Tx-Lq
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:08:50 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7115e32802bso52374177b3.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751533728; x=1752138528; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ndLtpZNVY8qFyDjOn/xAexiIb6QRnZYtnSMwE7mC11I=;
 b=ruOIElXCLRXE8dTis4pn/sPSgJS4oHhsUtLkYay85OdYCPRLkX8qUnScZGCjkkRWrb
 TpaKmHtPg6sE902EH6JCxSIfrKaPgZO9o4vnr+cV+URCz0Wo7f4eSIAModOBl8BslBlN
 B4JdcyjHpwHhj9MHNpZtwKpZrL28wX5xuHCppsrs4pZ/wCl1ysvpdDKtuy0tm724qhaD
 cwsm1u7ll0H2/Li0DW2kP8sKSUEwvWiTEa8HaEBq6TqSonI9pFYLViG57OXgtpS9KawR
 YN7LeJnPe/T4mfCP9n4SiPaSVyoj+Y5DDq3LHLPZQvHg+0/X5WepQKBDiFPS5PjE/inu
 FKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751533728; x=1752138528;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ndLtpZNVY8qFyDjOn/xAexiIb6QRnZYtnSMwE7mC11I=;
 b=UV92xrHrBN6nEULvIQ9rQCNZFNQWpP44Q3RMGWCr7KYRq42Q6j4RxTj+sT2tJMtkDt
 3LL/TGIrYZVrFwmBN3GQvJfBIcji8vjiGd8cT9zJ+BWwTBDmm++VoYK5amlOeGlYqkrm
 EOth0lG4ujnnozjOM55TqL7cmdnQroS78Sca1ZnU7RA/XkEYHx86Qy/qxXsgAobCqC/U
 SJJ0iD/IdWHlv1X1LDMfOSUKawCPAA60Zfp3keWbsHKY8v1xMgqQhyUshC9h/Q/nppI9
 i+n3zhk1q52fl4EPwa2l+9Jx/hEgTTXc3TMVIsXvdQWNjDxpn5IvG8f1oiDdb+GGBDB8
 ZIvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY13EkOLk654vRRPhYneRUkJhjVx5VqT2+Hp8MClf8x84c3BXi2S5tWGdkslD8PqYfm7E7UTOxOg==@nongnu.org
X-Gm-Message-State: AOJu0YwphksDietwRZOQTLi9mWN2ewwH2g1LfzAL20wPseadujrZtLUY
 Ks9dShjmpV+6rQTajX8QqLJPHtiOMt3QD7HSpRgNEjmEzNPWL6+5WW+qLU4ogkIO6Kc2iAFOZEc
 +6AGTYOUdug2YE2VQp/jnu4hiEZKFVs9qOxWs0PEJhA==
X-Gm-Gg: ASbGncssKQzZCSfsBf01gvvRt0TxKPjhZxHgbtXt4DG4JNwLxTeYAqRPYOVEskXxqE2
 YLIrMhlWKntBEYnE/kVCNDz9BInXiFxvjCiVGLvGz/ldC7LYLboWUWJG/YVraRXggdYrKSjV5Jy
 cLP6E/azbWMH2MMSzzzT2Bu4K3cvWzg1ScZwS712/6cCs/
X-Received: by 2002:a05:690c:6282:b0:711:a54e:8e11 with SMTP id
 00721157ae682-7164d40a037mr86462557b3.24.1751533727826; Thu, 03 Jul 2025
 02:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250702122213.758588-1-richard.henderson@linaro.org>
 <20250702122213.758588-4-richard.henderson@linaro.org>
In-Reply-To: <20250702122213.758588-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:08:35 +0100
X-Gm-Features: Ac12FXzjzR08JqGApFKRn6cTh1v3NH7EQz96r_fYdGdIa1cTMqHZPpyc9AzusP4
Message-ID: <CAFEAcA8ye-51xVjZzXJqdDnsJHuo9LY5s+EO4t-7BRbJ8Jd8Lg@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] target/arm: Fix 128-bit element ZIP, UZP, TRN
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Ys/PJqx6PN1f

On Wed, 2 Jul 2025 at 13:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We missed the instructions UDEF when the vector size is too small.
> We missed marking the instructions non-streaming with SME.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
