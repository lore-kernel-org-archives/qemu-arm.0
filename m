Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp542027lfq;
        Thu, 1 Oct 2020 06:26:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGm8f44TuW6iS+tUnb1+G5aSdGvBbsSYlQX8ufSyITH/5ki6lHroaMwYVwhQCFnCGAEK/u
X-Received: by 2002:a05:6902:c7:: with SMTP id i7mr11377894ybs.17.1601558785548;
        Thu, 01 Oct 2020 06:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601558785; cv=none;
        d=google.com; s=arc-20160816;
        b=dQALyUbCDoPMcWJtXiE1PNLz+aPM8hWoLfhmyEQ4DuVo9Z43NykGHH3OM7/1SfrMna
         YPzUJNBUD/ulqgk9wuZvuzqepjR6JpqM8vQANoDPN79gSir6w8qdZJiBnxyl0QJd7zSO
         Y5vw+2GHnHRTXxlMrJ9iaGX8tZPDCXY+xbxYDrehhEWcNLNz4kP1+QKa8ldv2FwgJ3uq
         wkGc4JdoeU9y5nshyiWWmjq4+JVIpB1nskTjl3KJzDoHgLKH9gTryK/4xbsKWf24QJnq
         TzZqzSWSSgBvjtYbzgoRvWE3wnCxKyAV1mrzOjztnFCCz8mytckSEKJpymPqTKYwMmQ0
         Xfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cCPScvmZd7tiO15Aq+mz85Yv3+3dVVQoESYwPVhEpgc=;
        b=IxZxUpeob553lhp7QXfMCHmPXwKpQtZ9DvTXEoUqovFk77uVBCPMdis6oaVJin692u
         ZZNWDHWnokvs0Ewvn6ACpvjK6Q62i7b1xb6PY53XQhB/0GaT/+SNQSUEiy0PsyzCxva/
         x1jq6AIiCBewIkmJfJPXFHltuiuMg7yFnPDf6z0qhC7m5+i3fpOOCZZL+vo0MYzjHivo
         CoM1EQlCDVUil40ZEMSu8sX9H3BW8ZAQVfCITnx4xl17baUuL+mum4MjNDVaq5QlNj6i
         X0XXuprmttI2180sN6RnCA00AynCOfhzhw3h5/w2cvQntJsDuI4hETPBm3+8I1f9tSVV
         RxvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X2CG8dMt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c131si4806653ybb.269.2020.10.01.06.26.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 06:26:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X2CG8dMt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNybI-00082o-U0
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 09:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNyZR-0006j1-EY
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 09:24:29 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:41460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNyZP-00087W-Oi
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 09:24:29 -0400
Received: by mail-ej1-x643.google.com with SMTP id lo4so8037369ejb.8
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 06:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cCPScvmZd7tiO15Aq+mz85Yv3+3dVVQoESYwPVhEpgc=;
 b=X2CG8dMtliomZ5mFyjTpW0o9CshN30/P9aaJ41CjfqHlN9oqUtjBD8jo/FEs8E2o6/
 rjk16b2IJ9Wz6kjwEXfoagrMXB3znLSlXWJETkHntAW/Pjc0JUYQ7vK09Dc4g9ie6map
 IOn3G+vz4yH4+A3yd+FRk1ZLg/ihaNn3pKnrBRZVqKnUz6owzd5tYAU9g+iZZdqzDaoe
 Y76tQmKqdjYCM968TooYEcuoGbNbqzJJ3r89KymbteVAV7J9VNGKBSbD7ZGOlfzRXb+f
 qahcntAuG3re9OJacVWgX1FuXMFBf7DmNs1+VwnzxXJZXQuLDOoCBwv6BimP8+MP9Rjx
 oIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cCPScvmZd7tiO15Aq+mz85Yv3+3dVVQoESYwPVhEpgc=;
 b=DflxIFY1zr2Ka/ud9yWvAO2otSKltrOpR7XjAKc65JnMXI5QC/7sMTNgJNGmbRbXZi
 OAk/xVVVsZur6kZRUK70sN709I+rFC8AbZNgwnLFffEUYVs+bAJyWrHQu03jYCdG+G7w
 pJ4PojnCj76MT5nJtzRx7IPM0rrWnXEx8fCL0Rsy0q4FTJYYhzDDkGdZXQk/qa8jl5IX
 PW8tBy8LmGFXCdub2rRQlhKWYsio2PqcJs3qPoeFQTO+OfU+whtESYjQYLz4U/rUDY6p
 vQ51/WdYcOiVR6jAByZdo4VnygNO3NvuAnYqqow/HzzhLWzmdI4e8a2U77pirmEu/Dzu
 JbRA==
X-Gm-Message-State: AOAM531hKoEgpYLbn4VRSotFXn2IO9gD1vZ/mGjTdSlJaQjN7p8f4ocZ
 78Do+uG/pJ7eg31k9nmvBBS4Viel6BCAafDPmsdMxQ==
X-Received: by 2002:a17:906:60d6:: with SMTP id
 f22mr1332260ejk.250.1601558666284; 
 Thu, 01 Oct 2020 06:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200924111808.77168-1-f4bug@amsat.org>
In-Reply-To: <20200924111808.77168-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Oct 2020 14:24:15 +0100
Message-ID: <CAFEAcA9U14h5u17wKFS8ooMgzFpJLKwfivWx4GqRJmpMtB62gQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] hw/arm/raspi: QOM housekeeping to be able to add
 more machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q6N7NA4XJGFG

On Thu, 24 Sep 2020 at 12:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Machine-specific patches extracted from v2 [*] and rebased.
>
> Series now fully reviewed.
>
> Since v3:
> - Fixed typos (Luc)
> - Added Luc tags
>
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg680135.html
>
> Based-on: <20200921034729.432931-1-f4bug@amsat.org>
> "hw/arm/raspi: Remove ignore_memory_transaction_failures on the raspi2"



Applied to target-arm.next, thanks.

-- PMM
