Received: by 10.25.15.230 with SMTP id 99csp848488lfp;
        Thu, 23 Mar 2017 09:56:51 -0700 (PDT)
X-Received: by 10.55.26.98 with SMTP id a95mr2958989qka.312.1490288211794;
        Thu, 23 Mar 2017 09:56:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a198si344142qkc.54.2017.03.23.09.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 09:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cr62d-0000qD-BL
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 12:56:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>) id 1cr62X-0000q0-VV
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 12:56:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>) id 1cr62W-0004VT-1A
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 12:56:46 -0400
Received: from mail-yw0-x22d.google.com ([2607:f8b0:4002:c05::22d]:33444)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bobby.prani@gmail.com>)
	id 1cr62V-0004UK-QV; Thu, 23 Mar 2017 12:56:43 -0400
Received: by mail-yw0-x22d.google.com with SMTP id v76so151232881ywg.0;
	Thu, 23 Mar 2017 09:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JEvQdS+Spxdux/7LKn+NkZK01GyqV4COWdZ5MYNiiE8=;
	b=fKPzWz5cwRMESgFyWRmVFu1g+H+Rxz0o3UtUBdwDl5ks+BRQ+CX7Rys1nqmpdu7Sou
	C2We9+UIco9bymXaMxpsX1qSbwFwDdc80mV5YlFSk8oO0Skb0Q9FxRA0mByneQ4CFukR
	1keR1S+Qld/f0BRdJzeQQqX0VEIMblBZZQcAgkxLxVbJQr1S7z2HYPYL+s+8dEFPxhy0
	c2gV0YA2uwleJuHmJkhFRgtdkc3v40umXUuXUA53i8Rpe2KXwvTXDnhHPFf5KFp/N3CB
	gsw5OTFrHeFDy8gj4qIdQ6MnnQVDRa+uo8ABTkFmcC+SB1SVXwL6ovSnTCOPxxlHzyUO
	oBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JEvQdS+Spxdux/7LKn+NkZK01GyqV4COWdZ5MYNiiE8=;
	b=ZNaEUO4ZaqB/HNFb3pQZjkvF+kHPZ4pU6HmPXW8lQtdabunzj+hRGU9k2F++6QfD1C
	KPk26hvTfRdTZS9Zak+AoiDqw51YOBpzFZMf/Q7Na+nlfaJGu9yZL0aolJ1NAvl9WNxL
	6laVg3om8NaFjoSECo4Z2LfLZMUOjrJ9pgo7fjEDXiyyYgW2J7lUCqxHbSG0oM2YjCfd
	uVtYWxYx6zy0c2R1HM8hVWToYNlBzbCY/dp9rGL2tePmVrLhBgKUnOgR4bq0cGSc+hpr
	h4Yqp6L6q00/J77P++VnndGBDaVkEWYL00Xp7VK29toyZGCoJUvze5hIRmowK3btxZIV
	A47w==
X-Gm-Message-State: AFeK/H3bCTwd3iBbyoYekavSAmAGihLdLZxbUQeM6vVJoLllTF0xnqB+tL/HDvPlXAFtCCaulgXnfIVo8HyfNg==
X-Received: by 10.129.183.18 with SMTP id v18mr2376785ywh.217.1490288202939;
	Thu, 23 Mar 2017 09:56:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.52.75 with HTTP; Thu, 23 Mar 2017 09:56:12 -0700 (PDT)
In-Reply-To: <C94A741879221447B4FC9B607EB4FFCD79EA34F4@DGGEMA504-MBX.china.huawei.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
	<5703D7EE.2000005@redhat.com>
	<CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EA34F4@DGGEMA504-MBX.china.huawei.com>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Thu, 23 Mar 2017 12:56:12 -0400
Message-ID: <CAJhHMCDDu_kEJichH=60N=np+ZKbU1e9bWK-pP9Z-9=Fn4w1_w@mail.gmail.com>
To: Wangjintang <wangjintang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::22d
Subject: Re: [Qemu-arm] about armv8's prefetch decode
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>,
	"Ori Chalak \(A\)" <Ori.Chalak@huawei.com>,
	"Shlomo Pongratz \(A\)" <shlomo.pongratz@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gJAy3btcmp1o

Hi Jed,

On Mon, Mar 20, 2017 at 2:35 AM, Wangjintang <wangjintang@huawei.com> wrote=
:
> Hi,
>
>         We see that armv8's prefetch instruction decode have been skipped=
 in qemu. For some user, they need prefetch instruction, for example, they =
use qemu to generate the instruction trace. We want to merge this patch to =
community, it's ok or not?  Thanks.
>

Your patch seems to be missing. Can you retry with the content of the
patch pasted in the email?

Thanks,
--
Pranith
