Received: by 10.25.44.15 with SMTP id s15csp5349397lfs;
        Tue, 11 Jul 2017 13:53:08 -0700 (PDT)
X-Received: by 10.237.42.226 with SMTP id t89mr2575506qtd.73.1499806388717;
        Tue, 11 Jul 2017 13:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499806388; cv=none;
        d=google.com; s=arc-20160816;
        b=a3ubZqM0N0Gi/ch83b5mQ74okawWSBCpyVS3UzK4XvOdm23sRnr4h/CSc2Eq74U1/a
         YEpbhBkPQNf/PT9eVe53KAaHBcd7oD4/yBY2Rj40c9q8zZpHRFWvcQwOZSaARFq050wg
         u5RPA0d8wc77K+fQOaYHHRqFibrxPFCuVm87WYHJl5TObhq26iZ4Lh6ZcB9zQd3xCxt/
         8Xmq+4VhY3A2pWb2QEH4IJldGpmZJ86rqPxXJKpzw+wjG+RW91pSfrCQ4ag4Wrl06bpc
         3rAH1H17+qIcPi70XHZ3xFW28CuKY28B71vd4fLAd59WV+C6giXxlhC9/WNurMWRn1MU
         3UXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ViI8jguMpfJB718kowuDeDDINILNmSW6xiAwqStSlOU=;
        b=IxP9kBol+SrOlXivEyLtKISjZfjTx4v8xdJZa4Jwrh8zAa7+peJjBz2XRlu74cH2Ft
         D+hkVrGvOb63u2KUlFYhnmxcvZw8a4fAHGREhEVujiM0LTAXZ5U943YPkoA8YDlgZbWo
         Eb6xSWvSYu4nyIt9kEaWWepeMjyx+fVvqdM9NTVmez+LY+wh2swmDMPk8ACfsrsYnN6s
         R140KNWMwJY8iXzbyVL2ee8LrQoJaglt5vZubHOV4QQOlngc64BaGcpE0ycVDTlS+F9E
         ankZ182f7+pz1pY+nrrHQ7pF0NanJWYDqQyNuYp2gybijTtzuZD2t6nZ3kJR0eTlVNe9
         py4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=IP4iMK11;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n2si365224qkf.105.2017.07.11.13.53.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 13:53:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=IP4iMK11;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dV29a-0005Bd-3D
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 16:53:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dV29W-0005B7-0I
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 16:53:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dV29S-0001tz-5V
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 16:53:02 -0400
Received: from mail-wr0-f177.google.com ([209.85.128.177]:33804)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dV29R-0001tk-V4
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 16:52:58 -0400
Received: by mail-wr0-f177.google.com with SMTP id 77so5630372wrb.1
	for <qemu-arm@nongnu.org>; Tue, 11 Jul 2017 13:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ViI8jguMpfJB718kowuDeDDINILNmSW6xiAwqStSlOU=;
	b=IP4iMK11kMoOcKO93kln3z7COOQbdFF+/QIH/5/SDtT9RKWWeUNDHpXMZLP4Z6drN/
	ivEj3EzTAVQkzqemAsFY/qcl1+ArD1mIjH5Jkj0QZVgZ88snc668c+yy18+L3LRhL9Df
	wCtjVBVTjExScDabl63kiYDdPzzfb0OBqOPaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ViI8jguMpfJB718kowuDeDDINILNmSW6xiAwqStSlOU=;
	b=tfR7Nnw7EPdQvhw5VvTO4t7HyZEzbYdbg/dVoZ82vJCeoH1fQlOSeUmLIGbI+srnKT
	K0RZoH9YZVOKT3DjXrRwWalgcjhFXw5KDWdiJ8SMaigg3vm+qSZD+vUroX6A+pqT8oe7
	Yxy9ZQvnicsYNGNwo7vR4JojT+qvyzLQvXxR9cSpLoKiG0Ckho2Qj6rH/E9urQglzvRw
	pjg9zeklfc8BP3V+knvrcTBnbp6YQGdaX45EzkfLCrVP25DyGJiS3VNqzGUCsGN+zaYO
	5+JmSFsPcJntKHT+gW7CBLoodt2rSpJ1zCG0rKY9ycVZfnfRoFJnE2zJv469a3eOItQq
	Irxw==
X-Gm-Message-State: AIVw111vvQXU3KfbiXSmuSPRtqo3QFACr/xz/Y3RM+BqF3r1oVOssxfl
	Z3qpwv+9C0R+rW4cNvTGLnw9MQU78kyth68=
X-Received: by 10.223.173.143 with SMTP id w15mr974607wrc.113.1499806316862;
	Tue, 11 Jul 2017 13:51:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 13:51:36 -0700 (PDT)
In-Reply-To: <6cee176b-a624-4f1d-aba6-e1c9fa011209@amsat.org>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-3-git-send-email-peter.maydell@linaro.org>
	<6cee176b-a624-4f1d-aba6-e1c9fa011209@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 21:51:36 +0100
Message-ID: <CAFEAcA-S7Dr2PuuaReiT0jRps-L=1Zc0uHB87yq8Z5EkR6+pzw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.177
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/7] hw/char/cmsdk-apb-uart.c:
 Implement CMSDK APB UART
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VShU0tw75/W/

On 11 July 2017 at 21:42, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi Peter,
>
> There is probably no need yet, but we could model a generic APB slave wit=
h
> this code, as an overlapping subregion (device top 0x30 bytes).
>
> For now only PID0 differs, but since all ID are 8bit the device could eve=
n
> instantiate the subregion with some u64 PID, 32 CID args.
>
> (thinking about watchdog and dualtimers).

If you look at the pl* primecell devices you'll see that's not
historically how we've done them. I think it would be more
code in each device to instantiate a generic device to
handle the ID register section and a container to put it
in than just to deal with the IDs by hand...

thanks
-- PMM
