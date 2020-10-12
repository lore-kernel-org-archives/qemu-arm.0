Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1158205lfa;
        Mon, 12 Oct 2020 08:49:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoX0GC6UYWwSRG6lme7z/MgDEjg3GltYB+t82axFvRKa9eywytq6+Nlggg9oFKoxYEKocM
X-Received: by 2002:a25:86d0:: with SMTP id y16mr4729110ybm.473.1602517741624;
        Mon, 12 Oct 2020 08:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517741; cv=none;
        d=google.com; s=arc-20160816;
        b=yyQs2GqnxVf5GgsK6Ri0SNmDLOYMeFpDOEHgfGGZRaN3+V1kqg1bdHZJm4hI2n6JZD
         q75dDcxl24o3G1qEzP8v3cVlXm8ekwEHI//H8GLQgOr/3qKr3aULNijcNG94UQgL2szT
         2V+PT/aVjNbNZtBleWJCAJ/VpBPOQeAnftQoeDvj/4iYophe6Q1gaU2QSALqnB64JyDt
         G5mHi7cSMxogDU6VG1oAX4Q5mzIdRWawmz+pVkxgWBbunwZlV2evqhyi4bLtfe3Nrt1o
         qBSIdVo50+Jn+n21oIrVowDx99sztjWlXUXCp/siVDp4VpN7lxPKmuAxh/Pu4bWd5/2A
         ZyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qCapRmoFaam/UUfcbHWT+v9WbVZVL68DDBiSNXMmIXk=;
        b=p9C/VR4PsW+LuAbJLElu106kJy5eq+4Zp2RyUH3X2F5/Q4hEeo1ILI8nB0Y8Tj0Q9T
         uOtoLcYNkGoGHxxDQTFOMVNe4xGCgrpx+eOe8PWTQyEHIT42I09EdacY6zDLNcWeqLXf
         R6q5oGJBYSQy4NE9W1zsPZYAACOnOgzGSko2KTbTOm9NymvrKdnI9DIsnavQ4gJn44Mv
         SNErOqLG9UeQ+Ki+glyKlKcfuVHjIbVAW5JaJi+YDH1SRG46z6Sdftkyvk+86WlJ4WiA
         Jp40tU5BzOpkLfMHZGAky3hUZPsA4ouc19KAMfbLtFIMZDIkQ+StdH65arJcLwuX04MN
         XiKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RQJcBOuj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si13648161yby.46.2020.10.12.08.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RQJcBOuj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS04K-0000T8-Uh
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzzn-0003CG-CC
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:44:20 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:39199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzzk-0008TS-QM
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:44:19 -0400
Received: by mail-ej1-x644.google.com with SMTP id lw21so23844186ejb.6
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qCapRmoFaam/UUfcbHWT+v9WbVZVL68DDBiSNXMmIXk=;
 b=RQJcBOujfDbxmMYNul04sRcksqSKxc477XsbtxYBPHxS/bnd+oMmaLf1ESIxTPP0G3
 OtoBbz4/hwvVE6mB/vWzL5PKhC6Dm4b8oWhs7ti2Q1PTTYOkVHPbKpeBAkXxnqtDebZP
 mMkn7oCaXqz2O6iC81acuOv30/H7veWwnm0K9IbjZFAO1xa1j7L4FpLUvlj6NsJbAZbe
 wOoL3Ap9Prw8y4MfhspWYzbODveUIgNYxT3lTiLiRmoFmzFpxqwe7R2qoLNQbCd315VN
 yPl2M/Pfjx8ihGzerG1xGqBWMU0raxUB2BbP2C2tVuPxggc+KINQZE8G7Zwk7sg4OwSW
 dw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCapRmoFaam/UUfcbHWT+v9WbVZVL68DDBiSNXMmIXk=;
 b=PudhnBcgVrrpZ6Cbr8pgk29EboyaKFWbrjXrgjF7CY5I4YZhul77pGHH3OjYbuwtPu
 2UOvV9XsaURCEDCFmtHTtYOzkYP9AK0DHV6Rj//paqdXMcvfW/zWCSweQazKqTmK/aCL
 EwI4ldgVFI8gn22lPLdE9S6a7RugWq/QkeAtasNG8Vm0gCSV+N2aydFRrQ+mEt8oSOec
 iZ5oOrFjwg2367VHbf9DfvbjHOqNEmpac2AD27DkczA43e1VuemalsnevFvb2+YoJNP3
 UnS25bJEqSxlhtPE4c93awMnBBRochWz3WiYWb9rk/KianUMwpy8UbErmdU9f5fk0Yxm
 jixQ==
X-Gm-Message-State: AOAM531bAxp1+w7NGWY2kp4zQsqdRVh7lExUhYCcIyeJw/oQtzSBFr5E
 /jw1902mPObtdAVN0rZc5oiIA5KNP6sXuj0NLnqdmQ==
X-Received: by 2002:a17:907:4365:: with SMTP id
 nd5mr29488808ejb.56.1602517454650; 
 Mon, 12 Oct 2020 08:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201012153408.9747-1-peter.maydell@linaro.org>
 <20201012153408.9747-2-peter.maydell@linaro.org>
 <d5d29e6-3fb9-927f-ae9e-67c67786391f@eik.bme.hu>
In-Reply-To: <d5d29e6-3fb9-927f-ae9e-67c67786391f@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2020 16:44:03 +0100
Message-ID: <CAFEAcA87S8yN+hvgew1nPE2V7fcMziht4XofLyF37xY7hRM+GQ@mail.gmail.com>
Subject: Re: [PATCH] Deprecate TileGX port
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1t1OLPgUbKav

On Mon, 12 Oct 2020 at 16:42, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Mon, 12 Oct 2020, Peter Maydell wrote:
> > Deprecate our TileGX target support:
> Is that 5.2?

This mail was patch of an accidental mailbomb of the list
with a couple of dozen stale (already sent weeks/months back)
patches that were hanging around in a directory that I ran
'git send-email *.patch' on by mistake. Please ignore it, and
sorry for the confusion :-(

thanks
-- PMM
