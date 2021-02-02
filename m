Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp258052lfo;
        Tue, 2 Feb 2021 08:25:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsIU7I7V9ytGJqg7Ncgw4HrbY3evXCWlhn7FAE1XidDE9eDQz4JVPoBmnmaJy8Vbbm7zlx
X-Received: by 2002:a25:7dc4:: with SMTP id y187mr76753ybc.477.1612283157249;
        Tue, 02 Feb 2021 08:25:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612283157; cv=none;
        d=google.com; s=arc-20160816;
        b=A9JzA4IQzC3oc0escf1BCywQX8aBBPd30U8pOH11XjK1ZtXNDQ8Eqx5qXwXxEOd4Ts
         5VQwZm5zDDz7irI1gHS4kt8pby8O7iD/GTdyZPo/IApyIGe8mG5c5LNVLDAHClWFMsp6
         K780+RNVzktGEd26tFG7oL7E4iAF+tPcwEqO4DQzyC9utK2j53Za1ZSbXwf86RQF00AU
         SYjot4T5BxjdNQrWvs2ODnSA1H+Ru6qhnvnjBlVxfMbX6dlwmQIlGsJj84trzg+HeCwc
         OQeOBSH8FOFnIKUm2NetSEeP7MeBR7D5ymStqYVELoRepeUUQv+NrSxk4+j2aW+FkhaB
         QcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+w43zbTSLJBu7VWWaaLBzSOwZdWeRWvOnn+bi1MmeVk=;
        b=zCeelV0wHIdcj0V2zYszgZTgBpSZp81gA99vKYtnGHtxDOG2/fvhNsY1Jb4HSJ8YQq
         tLRDikjoUVmnyCJkcu96DTNnmYTLwMvRXaXR9yDe+ihf0EumsN3Lq+5qj+6FL+jyZzzF
         4IooulveAHxhOv1mA3EdvQm504qji7lQpMQCis019BWsh722aDOc92KePTY8wbJ/vmmy
         oNPW6v5DFAZbBju924csQghOa3DYZ+kp+fTHG5jzBgIZqvYiWv8hfgAqSwol9yvtZkjO
         b8Im18GOWn3irQEGADF8h+tVx+SHI44ErgDD49M1nT5QmFT17AdaUvvm1TBwSOpy5hVV
         XWig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c/iUXsKF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c141si16025969ybf.205.2021.02.02.08.25.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 08:25:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c/iUXsKF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6yV2-00007j-AD
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 11:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yJm-0001gS-Kc
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 11:14:18 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yJj-0002MV-9S
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 11:14:18 -0500
Received: by mail-ej1-x635.google.com with SMTP id bl23so30821494ejb.5
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 08:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+w43zbTSLJBu7VWWaaLBzSOwZdWeRWvOnn+bi1MmeVk=;
 b=c/iUXsKFuYi6AQZEDZsSpBt0Jblyc8p3Ts7gED83JodKFbqatk9vRbNI5pL71iKpcX
 gtQ2giehUihl5luiN/nG197Iv7Dk9ol7gK2CtAISZoYl3PVZ4pkgc0qQbnIIIxHskvmv
 DE4MQsg1GZ3+4QMQ0wziOEn+Kykgqe3A23A625DNxzgy4HIbROm3mSONtwWrSYg9dLA2
 vE9UYHIj3h0MoMUbLcnFQrC5q246DjmLPa8C+O1Dh9mD7E0zcHFBJNWp0NE4ZjaH3afE
 d8bHYxT2PqtwatXqaWQUh8TABLS3KueP1xvkg6fGNgQ56+nnoY7rWwuMKgtF2+dJWhUe
 I5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+w43zbTSLJBu7VWWaaLBzSOwZdWeRWvOnn+bi1MmeVk=;
 b=K02/4YRj4ESgUhHlJJGj3qTk2tXmHPwIfUacaWXYC6LR6HvPIse/kGrem21xMmvEZe
 OPm8YludkdMZamMB1xRcyxNbOI5Y3adN81k3Lk6pYT3vhW1lhaTvAmeHipP8a0cjm+oU
 lalQTJuHY6HZhuit9b+MU6sTJ7Cz5dy7G9/oaFS3a5XbXv0837hbhcsAqcJhpSZ6eXmo
 dhJw8tOslLo++abwtRkOZ6yujjgJtllMFua9AKA8dpCv6wwWRTVhTJ4g374Y0T900QUr
 wftL6i5qo1ahEwHBwCVmkvLePxFmD7mqwQaZHRPY66kBGlGFnS7gcvmIlSp1VPEPI0Wy
 4nlg==
X-Gm-Message-State: AOAM5338WzgGokHsZrpkA8umlCFn7w+6htArFcCdil+cufRbVqeHOybN
 MBfTisFlNTt/RhluAS/cwY6usL0uR0y4jMcNIsBkTA==
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr23157728ejc.482.1612282453767; 
 Tue, 02 Feb 2021 08:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20210131164406.349825-1-f4bug@amsat.org>
 <20210131164406.349825-4-f4bug@amsat.org>
In-Reply-To: <20210131164406.349825-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 16:14:02 +0000
Message-ID: <CAFEAcA9bSzUfrYWjHPoG-jh2yS16U2DYP+gWRqfV+86XLuw3og@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/arm: Restrict v8M IDAU to TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ylYGc8IweI8Q

On Sun, 31 Jan 2021 at 16:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> IDAU is specific to M-profile. KVM only supports A-profile.
> Restrict this interface to TCG, as it is pointless (and
> confusing) on a KVM-only build.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
