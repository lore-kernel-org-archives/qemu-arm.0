Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp525140wrs;
        Tue, 12 Mar 2019 07:01:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoRDjbc5nJA6kAIT3onJRNXZb2nsIEKOxguUPeRJaI7I5Hlmwos8XPcVGFZK9GII0UaZWD
X-Received: by 2002:a81:2f91:: with SMTP id v139mr30425923ywv.118.1552399279000;
        Tue, 12 Mar 2019 07:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552399278; cv=none;
        d=google.com; s=arc-20160816;
        b=lGUOYkjVrsaGvE2NPozcsI0DzRAxuDICCDvxYgiNkqmv0PqHbv8+N4SXc5iBye57YE
         /pA8wY2greky2GpO4LnDStylUNmXEGQjM9C2JZ9wUEsE1lrAWXyCyt32mmAMJmuZK6oy
         AZLezmPsRvDBQ8fO6S+VEQP1SwJNY7iYjopvAASEqFphIiOOxqX/APIA+kMf3+dBgpDt
         pZJHZIRIKgUskjqhr/BjNZgb+ZOWgI/C99c4+eeiJyBwJT8yKecKj6YlSQ6nzK/sEHGv
         aUJVdjQiA5QlPzic6SK+h8hIAGQu6Ei0aFB//43bUi/Nt1tJxNLPSx/82a3QxF6qzliZ
         QZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=6JDHbRa8e6I+9J63d7IwetV+h8G2MSP95EJk6F4BQu0=;
        b=FTUkM5nX00p0350tex4sSJfxm0wzxKaEo5OzOZxhS6+MbxX/MwIA/ykEHFjTt/Q/j9
         n23sFZIYz4NNKl0ey4nU4A5a+8C17lwv314T1rYwVoQdXBoWpbJolwEXvK8eAJf+wjir
         kmTP1QePaFzWRfQwCOII9mPz/Rin01i77AqAMQ7VNgCFEFbbE2AZkCTz+/zUunBlY+c9
         ar5vqoE9eLyDKW1wtxHzAvABShUAwv1np9xC4P3Yj4l+Sx0rq7dwkfzNMsAlAeyUPYyv
         jfVXmZO2gmnRWBAOysZ9s3lG5bItMfDU0LimQjEbVGSsFtQElqBn4MY0KXY1ChQZEnKA
         YOVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="sM+oNr/8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12si4856488ybp.251.2019.03.12.07.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 07:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="sM+oNr/8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3hy2-0003Rq-Dp
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 10:01:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3hpP-0004VN-03
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 09:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h3haz-0003kM-MD
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 09:37:30 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h3haz-0003j4-Bl
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 09:37:29 -0400
Received: by mail-io1-xd36.google.com with SMTP id x7so2108982ioh.4
	for <qemu-devel@nongnu.org>; Tue, 12 Mar 2019 06:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6JDHbRa8e6I+9J63d7IwetV+h8G2MSP95EJk6F4BQu0=;
	b=sM+oNr/8oN6qTkMoDT9/o4ZulKysAz0IYrZ+P9TnIA/gKHa0Mzz8QwT5zTLc7nDyvH
	65S9b8qF1fpSsIJOq0KFlXrLQzSIJ56GtSZ29TTpNryXetu3G7FKxqX8gLQcyKphmGzi
	ASXo413HxWYDMaYaVv5+1uz7jGeM70oDsQkbUUJWYyGjDH4HZmQHe4nn7hzfC7Qcfsaa
	/gSLUzUhey1blFhrUBLunz+9EYE62DUeMQnOilr4xcbs7Fg91GXlrNlTmHJNh8vUvSs8
	jPOefZS31CI5qOqfj+oMYvspxIl82i1/njnnGphks/cgq6sgyMKgur6yF+itzLVi5noS
	YMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6JDHbRa8e6I+9J63d7IwetV+h8G2MSP95EJk6F4BQu0=;
	b=fJU/KLGo8gmoCjLIUiNZcsBlHfZ5pgbtq0QTyI5q1neGPyY1JqrvxACct8Ef9O9uQr
	ZD9ugxUtQRxz81lD/gz6q7N3f/A50QKWX1YcFQgUZHUpEGV1Y7N/QndBNz0vtfs9BUlP
	UP6sEcmZbonQ3iZHVHhUojtB75ADL7Qb5DXUCClWTSPp3pqOgzNkfZWNS0JqNL1VTcTx
	+11t5nO4WKoD5VMTzQiERnRsfaMeW85jwZiiuPGP8/6weSHkssMZAW6IKNF8n4KwkF/c
	YtlS1Q4YOY0NfrhXliUUb5xnzmBJTyyutsPA5Jay6TQ0VQE3POv/ftx7ZX5dgRfL9ZnZ
	klSw==
X-Gm-Message-State: APjAAAXGvh3t1Dh6NtP3GJEXtxHuZlIuGTe+C25K67eguz5xO/1GUpvW
	urYPMlbFiI39KHlfNHaZHlc25byzZe9TS1KMEPUwsA==
X-Received: by 2002:a6b:e305:: with SMTP id u5mr406865ioc.262.1552397847148;
	Tue, 12 Mar 2019 06:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190311191128.30562-1-laurent@vivier.eu>
In-Reply-To: <20190311191128.30562-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Mar 2019 13:37:16 +0000
Message-ID: <CAFEAcA_y+6WVkpkGww1UszZCzQjkcifz671MUOzVM-7Z7XdQzw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d36
Subject: Re: [Qemu-devel] [PULL 0/5] Trivial branch patches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6qmGTxyAbjxL

On Mon, 11 Mar 2019 at 19:11, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 208d92df447bde0f1f810fae8a2c523cdeb7a2=
8f:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190311' into =
staging (2019-03-11 16:27:14 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 3b777a79c1cfa40f39f96220bc733eccd7392c9c:
>
>   hw/nvram/fw_cfg: Use the ldst API (2019-03-11 18:48:20 +0100)
>
> ----------------------------------------------------------------
> fw_cfg and thunk code clean up
>
> ----------------------------------------------------------------
>
> Aarushi Mehta (1):
>   thunk: improve readability of allocation loop
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/nvram/fw_cfg: Remove the unnecessary boot_splash_filedata_size
>   hw/i386: Remove unused include
>   hw/arm/virt: Remove null-check in virt_build_smbios()
>   hw/nvram/fw_cfg: Use the ldst API
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM
