Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5140507wrq;
        Tue, 19 Jun 2018 06:34:24 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKb+/WnqDG0dEgB7gV1MJNdIOMesHEUBrPHeGShPaPFu3bEghTirrRhtMTBmuLZUUys9Vxx
X-Received: by 2002:a37:2ac7:: with SMTP id q68-v6mr13451230qkq.77.1529415264082;
        Tue, 19 Jun 2018 06:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529415264; cv=none;
        d=google.com; s=arc-20160816;
        b=VKw666ccWRpl+qE6na7WKAfK8dy4UDLiAVALLt8yBC0dA9WyN4dYE1xc09TcJBIZH+
         imhAPZ/vsaMb8qyjanHh21Sd5ZcU8R9K/uXTEuqBSFZr1vEzz7jSx7Q5gj2zmhALhn8R
         lBAAVblGlV0lRcsKJDt4OStrvppuDEfDWEx86/W4xyTCDeKnUOHYJax9Llt3yYi2iNsi
         8rEUWLcOYDwpxy2MQ7zImy55yc8hBcKuI4BV//pS8FkiBiE6MjN5u1JbCyFg0efEr8li
         M9KIW/DK44CWPuMB1ozF5R+CldMn5f997EgUv0hCeGf7eBveuWESav9+KqzdWMElWGWF
         s9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/AQFotw/GszxYDTcctPj3pO5XA3tKSjF9caNy2Bn4Qs=;
        b=TmNwKdgV2UQPrzvXxlOJzvqkp9KTR2VLFRCJaEYnLh6jJEMxCCm4rTVE8mLe+oqcXV
         q1BCmoYeOQKdAjzV+DsUcwjlk23/K5rYbnMMiY4c4Xx5Zxy6CyWJZxiJMa8bUCPcYrqY
         ZvSvJV1osILm9bCX9d7lHOWOkmdSiWMfQyDxE9NXti7Dk9SCKJb0N2jAJ3Vkhg7ru4mz
         GGAWD60bKielQ1XgMOiBOWw0Qk25YsyCGGryG7difCRXeH8Xp1/wwtk+FO6vrAbPnm+M
         XF5ddSOIyWOzoTDh6yTEFqP+h8Njgltiq3/Ir21z7m/y8sVcWTXufaulFUkzG0/Gug9t
         ZREQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CqeYZ8HC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188-v6si10124450qkb.204.2018.06.19.06.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 06:34:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CqeYZ8HC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVGm7-0006c3-Ko
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 09:34:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVGlz-0006bb-9q
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 09:34:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVGly-0001ii-H5
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 09:34:15 -0400
Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a]:32848)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVGly-0001iT-Bs
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 09:34:14 -0400
Received: by mail-oi0-x22a.google.com with SMTP id c6-v6so18147427oiy.0
	for <qemu-arm@nongnu.org>; Tue, 19 Jun 2018 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/AQFotw/GszxYDTcctPj3pO5XA3tKSjF9caNy2Bn4Qs=;
	b=CqeYZ8HC9i8oVPgGBO0hdXYl8RUTWEPyZYyz8TpEigpN8AsY8Dz1iUvYkUBWV3tFx+
	PrbyL6dP0R7WZIxNlBmiw3dT6Eirv6tsu7AgHUpbR8CYRDZKUu2Sl9wmYlgjLMXsmtOI
	jrUNsRYhsmwn3JF5ByYG4Tw5SUrsmdy9irW1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/AQFotw/GszxYDTcctPj3pO5XA3tKSjF9caNy2Bn4Qs=;
	b=AV8xQuuJuauhz6icxO5ERhuzOKzPAtJW86Am/ZyhNeQZYOM4n6Svxm5TSWYXNyXKPT
	9zswbbBggDxLW8vfEnAM6X/M2jy5UzW77RT0n8ySb7I8sG4Rq4DBoajHfMaXBMo+D7bD
	n03tbm0jPL39UylXJhwdlSeeE6tuiJjxROsoOmubrR0uZAVdVMiElrSFEx/8opPkcHHC
	B/ZolaAS+6r24wMHgPAtg6RA7phRKDYKg6CwK4WgLnTE4iR1DusE6r51j0MpGZupnVVx
	ZGP9KETq00T9IfQhZqMBw6VvoZhIyvJbalYYaz+wqBNzTNcoZHucEwSJfeIxIkTaqwTc
	sl1A==
X-Gm-Message-State: APt69E3WpbhhR02AtKUlXIEdcKDW3ncSeEEkEwjNXlzyUkdzZ7dO33q3
	50KixlwiDkMLuUFY0iYJd1p7q+kwYL8fOguAxB0F+g==
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr9924690oig.102.1529415253626; 
	Tue, 19 Jun 2018 06:34:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 06:33:53
	-0700 (PDT)
In-Reply-To: <20180618095758.5006-1-kraxel@redhat.com>
References: <20180618095758.5006-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jun 2018 14:33:53 +0100
Message-ID: <CAFEAcA_9vgP8S0t26fRKhmMw3tL5ea3i4KfURncQeHE4VUVnCQ@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22a
Subject: Re: [Qemu-arm] [PULL 0/4] Vga 20180618 patches
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jt6IRws5DHy7

On 18 June 2018 at 10:57, Gerd Hoffmann <kraxel@redhat.com> wrote:
> The following changes since commit 2ef2f16781af9dee6ba6517755e9073ba5799fa2:
>
>   Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20180615a' into staging (2018-06-15 18:13:35 +0100)
>
> are available in the git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20180618-pull-request
>
> for you to fetch changes up to 58d632c7ce66c272868b057491cec7ee5a6a1050:
>
>   Add ramfb MAINTAINERS entry (2018-06-18 11:24:25 +0200)
>
> ----------------------------------------------------------------
> vga: add ramfb, print virglrenderer version
>
> ----------------------------------------------------------------
>

Applied, thanks.

-- PMM
