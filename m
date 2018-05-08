Received: by 10.28.4.212 with SMTP id 203csp4228209wme;
        Tue, 8 May 2018 07:20:14 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZobxeGO9qeLlW4c6EAEhvXfD++8SI2GyD4zDtys1KcsWOyTXQ/Yjazl6yfMD5Ss+LlWPbwW
X-Received: by 10.55.217.15 with SMTP id u15mr32886036qki.123.1525789213938;
        Tue, 08 May 2018 07:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525789213; cv=none;
        d=google.com; s=arc-20160816;
        b=ibctPRh5nu3UsMCqfVknBBR1XT3Mfgi2GXCMw37GvM8oV8qpKLlvYHDiMnVtPmPju4
         puOoDn4lezVMJTtg+lrzfO5LiSqlNywNC2n4AgsSRBFOSn524khr3UY7cicuQXNdd2lh
         fxWVAxHT1NsUwYAWSqijEHwGJtkEjo+ppATDWtH61tUE03jUyG++G676GOyblL/QS6dY
         7EfMUtNyRXxkYvfJ5eyowlQQo8GBdazEdN/KmfDWPog4E/mRaeTlCTkMrzzgtrSd4F8y
         OXoDSLfx5eqWxO2QS367oDM3E5zi8g/tZz6vBIP3hoX15lLZ2RPibPcRKSUCWUyFHGXf
         tMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2RzOpl78wTOR6X3YRPao/L6rW69c80QZFlaKLVBuR6Y=;
        b=tW9ilW2VQMXD7iTSS3gawsa8rNbGj7Bq3lHEYgl3djT/x0H4NsG/Ks9nKilcqskLk2
         u1I4ZjUkT0EIp1p7p7yn8eSLrkLBziI3qvL/8qKE9uBZqGgnpQqVd74o6j18+Sl2M9tG
         +FU+2BzzTa8G70IG1qY4KGP1rgacZBwWyNChfJsTPg2T+GAsJBgJzHCAN53FE+jFaOb4
         +KSA+BckP7taStzPOi/Ddl8Fo77V+G+3SZM5CGzfpFXLR/p1ro0Rw5QeTjJ+nUg0J9eF
         h8VvJPAh+OtAkoZDucdv7soVeDsQcumADCJBP93Qsujj16/nLjG6Cca5wWxMdmbJWuUM
         AjhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kBtUtZQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a9-v6si1207594qvn.197.2018.05.08.07.20.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 07:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kBtUtZQI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG3TR-0001C1-EQ
	for alex.bennee@linaro.org; Tue, 08 May 2018 10:20:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fG3TC-00019Y-HR
	for qemu-arm@nongnu.org; Tue, 08 May 2018 10:20:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fG3TB-0002NE-OA
	for qemu-arm@nongnu.org; Tue, 08 May 2018 10:19:58 -0400
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:35104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fG3TB-0002My-Ic
	for qemu-arm@nongnu.org; Tue, 08 May 2018 10:19:57 -0400
Received: by mail-oi0-x22e.google.com with SMTP id a6-v6so28473411oia.2
	for <qemu-arm@nongnu.org>; Tue, 08 May 2018 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2RzOpl78wTOR6X3YRPao/L6rW69c80QZFlaKLVBuR6Y=;
	b=kBtUtZQIVW1Qlr0Oahq8Neqn1ryxxv4lRkb6A5h1imfvPiLOaUGwY9raSeefJMoQvY
	C9y972ula4c1ezH+JODkKlZwGvKGdkb/7xcOzuKvy6/uq9yrpdm/C3wBOkvVfF7zPhhH
	kf0TRhGG9CWhpJf1bqqJFGYAHhPukme5/KB3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2RzOpl78wTOR6X3YRPao/L6rW69c80QZFlaKLVBuR6Y=;
	b=fZWO/jkLejH/YftbTZ58Yp6G21GT1cYdyhcn4ZdwnH5yMz3v00vPGzpWHptk8qebQc
	B1jfwPSTSQH0jioKoUDX4Bn8HsDgBEOzwmOm/5IQYc+BaAMkzLFFIYWGd998NfANJFp3
	4DtlYsnK+MG4VcFGJIwFupyss/6ewaxChTXFYWsz5HO7gZoGmP+sZW9lIMhmv7TD3GFl
	T1GKmYxDQtQ+Uvn8WYTdhOdfF28M+JdofPlXxYRbLzW3xUw2XVw/ITEOGEgIbCXopRdF
	y4BiyiUnKsYsikK0dKPznWBWUMWnkwS6CGu+5Qm0vvf2dny6xCepBsBHEis2Kj1Ej81t
	wZ9g==
X-Gm-Message-State: ALQs6tB4HbFm09Fnc3usE3xXRyRDTkqwEToDqGhFnuWrBv9e0wPIeRh8
	1ybmCNw6mxX+y+VMz1s/gaKGNKuIHDe4AI7QWJYgMw==
X-Received: by 2002:aca:cd0b:: with SMTP id
	d11-v6mr24980395oig.337.1525789196958; 
	Tue, 08 May 2018 07:19:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Tue, 8 May 2018 07:19:36 -0700 (PDT)
In-Reply-To: <1525691524-32265-1-git-send-email-imammedo@redhat.com>
References: <1525691524-32265-1-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 May 2018 15:19:36 +0100
Message-ID: <CAFEAcA8vrk2VJBDrWkTCqa=5g3+6tTf-ijHF7w42+zwhBEJzbg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22e
Subject: Re: [Qemu-arm] [PATCH v4 0/4] arm: isolate and clean up dtb
 generation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gslTCFt5008w

On 7 May 2018 at 12:12, Igor Mammedov <imammedo@redhat.com> wrote:
>
> Changelog v3->v4:
>    * dropped "arm: boot: set boot_info starting from  first_cpu",
>      since it's applied to target-arm.next
>    * fix crash (in 3/4) when QEMU tried to load DTB but none was provided,
>      get_dtb() hook isn't set by most ARM boards so such boards crash
>      trying to call it. Check if there is DTB before trying to load it.

Thanks, applied this version to target-arm.next.

-- PMM
