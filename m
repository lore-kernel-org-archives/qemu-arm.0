Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4083837ejv;
        Tue, 2 Apr 2024 09:52:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7FK+e/Sn9swdEyYd68o/xvmuazULPz+byHK7eVibvOpXAu3K/ZWSa3XXiBcJyUe3j8Xz7g1QiAi2VH50zJHJk4tl+dY0e
X-Google-Smtp-Source: AGHT+IFSJo7WNSc+Euxu6x1FbFFNtItcp6G76botRkrrNncSx15BlW3+0Jzmr4JNvwpj1u10zL/a
X-Received: by 2002:a05:6214:961:b0:699:21f3:9f77 with SMTP id do1-20020a056214096100b0069921f39f77mr140916qvb.4.1712076766411;
        Tue, 02 Apr 2024 09:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712076766; cv=none;
        d=google.com; s=arc-20160816;
        b=cMrKvbuF/WiO07b1hp/3AXaAEZfj8gWbD2Lt7Xgvrby4ff+weLQEBic222BuBPdELh
         ZnvTO9xnJJ9I95wVOZqSllz9kpQzgeQtdHejk3vuLgYTdfG22RlExQDoiLPodRpERml/
         yQgqp/seOuWVkrcqYn6boPOn5TrRvtSjJ3gOfDdZuX8DOlMSO6mfGUVqgn3A4I2Swnjx
         GgcNkEgFOxEK2RJMtM8OdUWX0Wh8Uz8N6Uxdl9bB+O5LP3cE3S2FukUIeIp6I1+VRzt1
         gay2b03FaSs2Y+QBypuGBVYIdf2CULnnZXn4MbKDuwi4dxAqAvnFOQkopF4U1oPQ4GGx
         tLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ht87CMOLxyFRaVHEDse0dDw3f4zfzSCSknSCAvE5adA=;
        fh=iMEnPKjHMu6M+Rl6C//l7WskHSf69dVyRjL6xtF+v/I=;
        b=LPnUeGYfMk2QxV0/WomELa6wMq5tmW7DyGkzdscvqAa5Lc/1wXB4/Xa7RgKMJZD4Ya
         FIg/UleCh/+3STTXonxTpwpxp/RU+9wswEjd1PNk3L9OnOxeASZ87AcEc8a9TE1E/d0n
         D8Y6QkSeSXCRattMCZ7Hff4HGpf0l0lKpTqkxV6Maw75lAX2wAiheXzLcrpg6WPSyTBz
         kmsNYhb5CKJMaGMX1E0kMf0ACkAi2d9NkN509BjU4NCSRTrvHLSZoWoxCJBBvhDtizIx
         AMEZDHzD54puXyXc9jOArXKEr6zwjN3/sfypS8QwKIsOrFzHhACmWBh9ojhO0V8DLmdX
         xfyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GuyIo1JC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1-20020a0ccb81000000b0069019d451basi12408749qvk.66.2024.04.02.09.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 09:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GuyIo1JC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrhMt-0003vi-Ic; Tue, 02 Apr 2024 12:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrhMk-0003sm-HJ
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:52:06 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrhMh-0000RC-Nz
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:52:06 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56df8e6a376so127605a12.0
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 09:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712076722; x=1712681522; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ht87CMOLxyFRaVHEDse0dDw3f4zfzSCSknSCAvE5adA=;
 b=GuyIo1JCQR23+FQWy8aZ1y+0pYfXddJT5THAzHtdLuCb3uJKVVad7mpVfFCpVsZqcA
 LnMLtwV/uvX22gx/6gdKyFi+iZf2MAb0+KmA3LgWwnMI5NOnL9fzoRZyTX1HFNFG8Azh
 2y+Uu/+3SqEq5EVDk9CCe8yQqP3bSedqKfC+J94NIltLENWvtyrGJZP+oqM6v7QMh1w8
 nEYK0vEPhhP0iy34gIqNmLGKq+Evb6DcOSF9TY1xTUyxaoieevbm6gLre6EC77aAJPg7
 jkPJCkmMlpLIy+voMtieM9T9m13gW0ZbFu9Ezm0rbAYZ6DWMy/XT2PCLHdsvypJtRyqu
 n2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712076722; x=1712681522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ht87CMOLxyFRaVHEDse0dDw3f4zfzSCSknSCAvE5adA=;
 b=KD8ZVvmKZv0xwhfkCG4h2hLCznu9/zkjvjjqt81C17i5GqunNq0kW7jeANJzBMzBf9
 AQlgP/a65b1xXpLcGxWTDL1ruPEQ4MkFSM4XAwWcrGhOg5/PWA2sVO6fLzkinNjFXad4
 rQiAiSiK3FMRStI8jOWvBwBsAnFw+IkNUDTCiK34VXmQ4Y+2Zs/1OGHzKgNBaKcwO1yF
 d+Az7f1FJqx32EmAo7oqQOJq3j/fpIzUhQnHL+2mvyBdrx4Eo05kWKmPhAfg8vqiPtUY
 wFAi8KTEotMi2MDNM/h+F4SMiXIKPT18F3cES9BoISjiLeK891+PSAPkoG6hewkCShII
 J9YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtSEOxYHiyW5IH2+j2oImX8wqj+vV3tPDEErilXdZjg8J6uMT2E54DpopYEB4+nJt6jZDqOpKeXQb4kq4uBV/VR3P4
X-Gm-Message-State: AOJu0YwaC3jW6za1x1CveZe90Af3jl2DERe2nh7ygBt8d0NuB0vMWRSO
 pkPFHbJ+20ef4C71fAv/zqPpkEeeWyZXPM/TDo7M5Jqefsq8z4tR5gRUUJuZ1NB4Z3GHe4I5Dlc
 4oQyKoIEvehTD01tVn98BCN/d46ZYAEF7XPOPqw==
X-Received: by 2002:a50:a6d8:0:b0:56b:ddcb:bb67 with SMTP id
 f24-20020a50a6d8000000b0056bddcbbb67mr58343edc.2.1712076721787; Tue, 02 Apr
 2024 09:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240402142431.70700-1-philmd@linaro.org>
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 17:51:50 +0100
Message-ID: <CAFEAcA_v6WCwJJrbqtFqAWQNC1BGG37p6WXyVTrWWqLwa71c=w@mail.gmail.com>
Subject: Re: [PULL 00/15] Misc HW patches for 2024-04-02
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Yhn7d1hGQrZV

On Tue, 2 Apr 2024 at 15:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> The following changes since commit 7fcf7575f3d201fc84ae168017ffdfd6c86257=
a6:
>
>   Merge tag 'pull-target-arm-20240402' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2024-04-02 11:34:49 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/hw-misc-20240402
>
> for you to fetch changes up to 4c54f5bc8e1d38f15cc35b6a6932d8fbe219c692:
>
>   hw/net/virtio-net: fix qemu set used ring flag even vhost started (2024=
-04-02 16:15:07 +0200)
>
> ----------------------------------------------------------------
> Misc HW patch queue
>
> - MAINTAINERS updates (Zhao, Glenn)
> - Replace incorrect mentions of 'softmmu' by 'system' (Phil)
> - Avoid using inlined functions with external linkage (Phil)
> - Restrict CXL to x86 PC PCI-based machines (Phil)
> - Remove unnecessary NULL check in bdrv_pad_request (Kevin)
> - Fix a pair of -Werror=3Dmaybe-uninitialized (Marc-Andr=C3=A9)
> - Initialize variable in xen_evtchn_soft_reset (Artem)
> - Do not access virtio-net tx queue until vhost is started (Yajun)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM
