Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7008662wrm;
        Wed, 16 Oct 2019 04:25:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4SvP1XnNuOlm8hF7WyIy0h4TkHJawdQa+3h8lGHDyrikRzB6Nzm+FRZoW7+xDlQQlgKRN
X-Received: by 2002:a0c:fd2a:: with SMTP id i10mr15652757qvs.120.1571225101033;
        Wed, 16 Oct 2019 04:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571225101; cv=none;
        d=google.com; s=arc-20160816;
        b=js56U/XFlznjx6pST/faowMnwGYu7vRIlLdEMyoL7dPFNvoij1aORlPZqeeRno4MDA
         4JlKrUiH/fP/P3MCLV8Z5wLWOYKXgwPq4LoN/di9x9u2RkcqvKL8CcD8YLoWedAYzRdI
         J0uRkX4ICseSWGAtfqAXCnKQw1PoBsL5Dy7lSJO1WI6XqKSaGZ95tFqhGoSiQYLZ+6iI
         MkTSqQ/3v87GYN3/oHUSNQsoEdU16O6SZRc9eF7ocfe+TWTLlYi4hkUKgkGys/3vgQZs
         pC1GvmuuD2Il/eimBpAX6BlCqgpUJkj9KcIyqMcKXqmfZVZ/+GlMZU+5yH92wc2RIzXP
         uQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=X1wLTwckVbez8zZGtf0g/B6tnQebMFF5Z8kQian0sJ0=;
        b=i5U1vddWI/2Tz+tgZWeba9PejfiqOrHTHt7GU98bqthw7hsaojypbpgGCkQKXrbbyA
         aIaO+QpZO8UFk9qLm+VlDsB3Kgfdmz1aSTmCOjrNl1c4PRWhHDGtcuJr+NQjV/IKgMhv
         3RFTPo8BfwxWqHCXkm6KJsFpHtOarqUs5OJpMyijAzTER5W7EhMIwaNVQCLRjnudzY0z
         xiZYnPyLW2S0btCLiNhX/jGWqepJ6EhA5HNwXUakd0vdm81XwSxukmZLCl8ZCpBqYzVN
         8+aGyCAzj60zfX7/wVSHEebISbtWC0mu5Q3XsNBHWSUzRrJtLSjfE5PwTMI/KEE3Oh7a
         EJYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="Og8Qi/RE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si23105924qkd.253.2019.10.16.04.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 04:25:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="Og8Qi/RE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKhQK-0005mh-Ci
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 07:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iKhPr-0005kj-CA
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 07:24:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iKhPq-0003aS-9W
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 07:24:31 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:36451)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iKhPp-0003aI-UF; Wed, 16 Oct 2019 07:24:30 -0400
Received: by mail-qk1-x743.google.com with SMTP id y189so22373863qkc.3;
 Wed, 16 Oct 2019 04:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X1wLTwckVbez8zZGtf0g/B6tnQebMFF5Z8kQian0sJ0=;
 b=Og8Qi/REf4WVbtAX5wfM9WUj60NfGQpjdYxg1Jgb+TUkXzMHPF0+PbZjAaByn6oqbZ
 6ZfWIVMz4rQytOvNv033mFLrbVFLgzmT4J6a9mGQa6290GBHjFJWOm2ajIfLFJ4ZKkVo
 6ZvG5HCYQvhgvF6nmlJWR7tEn+wc47YHcgxXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X1wLTwckVbez8zZGtf0g/B6tnQebMFF5Z8kQian0sJ0=;
 b=r89fFxLrm4Zuj5CdLxfTP/uHKbaQ16ugLJa2mv4tPTPLyWFHbFD5Jo6mWtOJRq1Wmq
 B3TksDMEVjXATPPLB+n3Yu1rUshadvfvqxM/uaZWhQZ5hVDSc9DfFyl44JNZgotm16yi
 4ScCFtejymo+O8b4Sha7g8QcOW5BHTaKFkh7KmyUw2H3kxQqLA+AcJf5rE/qkCIt4S+0
 I+YZRPbqGWTc2uZk0IlZDSnIHd2WU3iSpVonPmj2EWNmWi6PGuYis0SQgVJKYxcWBf+A
 919f6aP4JiPpbVMPqvWJ08gpLFA+spin+Gjxq0dgHMhM28hDUWyeEYs9Lkv7F87xFKgj
 fs2g==
X-Gm-Message-State: APjAAAUT5rFWRGzxhzEeqpdVejUNwlgJQ6L+bVW6hXRaIZ2ozonCzxt0
 aqfWZddvUu0tpZNPZJaNU+M4X9ThvGODx4rZ+d0=
X-Received: by 2002:a37:4dca:: with SMTP id
 a193mr40163108qkb.292.1571225068768; 
 Wed, 16 Oct 2019 04:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-2-clg@kaod.org>
In-Reply-To: <20191016085035.12136-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Oct 2019 11:24:16 +0000
Message-ID: <CACPK8XdULytZOsapN=wmAqz5GDD-v89-eTi0byo1O9DtVm3y2Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] aspeed/i2c: Add support for pool buffer transfers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p6gU54WXmgBL

On Wed, 16 Oct 2019 at 08:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The Aspeed I2C controller can operate in different transfer modes :
>
>   - Byte Buffer mode, using a dedicated register to transfer a
>     byte. This is what the model supports today.
>
>   - Pool Buffer mode, using an internal SRAM to transfer multiple
>     bytes in the same command sequence.
>
> Each SoC has different SRAM characteristics. On the AST2400, 2048
> bytes of SRAM are available at offset 0x800 of the controller AHB
> window. The pool buffer can be configured from 1 to 256 bytes per bus.
>
> On the AST2500, the SRAM is at offset 0x200 and the pool buffer is of
> 16 bytes per bus.
>
> On the AST2600, the SRAM is at offset 0xC00 and the pool buffer is of
> 32 bytes per bus. It can be splitted in two for TX and RX but the
> current model does not add support for it as it it unused by known
> drivers.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
