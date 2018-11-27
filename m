Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1301297wrt;
        Tue, 27 Nov 2018 05:56:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5cMHpqFU40Lif7BSBKIWo+gyiSEmfdVD4HLfbSFySC4zeIdjABAekYXdnLBQfvLfuOsCbTk
X-Received: by 2002:a0d:c887:: with SMTP id k129-v6mr34484997ywd.485.1543326986667;
        Tue, 27 Nov 2018 05:56:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543326986; cv=none;
        d=google.com; s=arc-20160816;
        b=VZB8QoGIZida8KOipLkmOY6wEWjhP2nSsXVrp5YMjWA9lp3ZdSLnG6jn/BTWoaFsr6
         kLQQc1GdXD7KTcnFvTEXtAQkmcJAOJBbHfvx7dQJaP8FS19/WH6uP7FliZTVk79sxGeB
         ayaJbeLTIXlSfLQ0lrUqEAQ6HSREgJGr0Z4AOwAhdkF3xEEHI2dZePqZYFsJ81ugA1bj
         lNZk23Fa/FSJBVYutxJr9f1GsLY5aHkdMqJKm0nsUAvRqDv9dzmEgO+5li6dx5y8T2Yj
         vO72Zb70g/kmNGmADMvPlOvvUgcNEePNU/KOYcOIP9Vcc5r2cTzVZSl2b5kSwDcSQdyA
         TROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=bPlyIxSGhfVm9p6+FRji25rgkxG4nP/59u6vOxg2OAk=;
        b=K8X7+vPRfVDV6ctXBkzqCiRs0x9LNXTvq9+4XBpbYqsf9vv7u8Pp6sLs63KIH31itM
         JwvSa/hAyN04i/OcLjaMnnWv612O1gzaHOyM4e7JRcgnYbJtki2wHVv0ErDrOBogUaeb
         hM5a7vROcAQgXfSntkP5iTiEs+S85nKT7LBBYtn6Us5Xz2SAKYx9/HPoWIQ1Oh5sptGT
         ZqEVrFCbvHJ9Ai0ScmOHDzZovHc2MS0n/13aEmtzaMzRf1P/rICgJLRJDAn6U370n4/A
         BuLXMYZvOzuZXcI5j2K9p8JyN+ZRd6o0c5r5hiJ/mxGNjXLdHtkbxQ8XzSc9C3YsLxsc
         700Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3-v6si2861402ybj.307.2018.11.27.05.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 05:56:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRdqk-00061u-4Y
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 08:56:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1gRdpg-0005kc-R3
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 08:55:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1gRdpc-0000UX-QC
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 08:55:20 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1gRdpc-0000Sz-Jr
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 08:55:16 -0500
Received: by mail-qt1-f196.google.com with SMTP id y20so21734605qtm.13
	for <qemu-devel@nongnu.org>; Tue, 27 Nov 2018 05:55:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bPlyIxSGhfVm9p6+FRji25rgkxG4nP/59u6vOxg2OAk=;
	b=uC/3H7qXodj5jSCV4uoTJu7DK6+KJRuXjMUk3NPFFEP+WMCf1Dl5VMHje7zo4qQIrU
	/8mqfcZDuneuLYtN4LrJzt1rTRxOVhsZt77vh2Vl+nCUYIjTLbl5C0ZkJy3zNuimGqJV
	YXQDn+8geR6C3pBMAgc8/Fl/VTZnR22M5DFqCZTZ2HazvCw47pOz9LSCBQUAvzMDcHB5
	FTVOribhZyJbAbLftT7zbTbaQhQPqOAupwG9g6/iGDQhHrHZMoFwYtOLQICEjVQQeltH
	tPTjN3AY88q+MLP9hHTsVA3bE62WpmRurUj8WToUanpqr4fkwtyf64oX4SEhFVx5NZJi
	eDAA==
X-Gm-Message-State: AGRZ1gK7LgPzwz4NOuWLIo8xwHITa40Q+H0eDO7L+jkSDkMxOXnG8wSw
	jKURbGSyip3L/ERxoZnF1LFsdYXAbvSXO8Y5z8X1+g==
X-Received: by 2002:aed:2603:: with SMTP id z3mr30698404qtc.120.1543326914558; 
	Tue, 27 Nov 2018 05:55:14 -0800 (PST)
MIME-Version: 1.0
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-11-marcandre.lureau@redhat.com>
	<20181127134154.GM18284@habkost.net>
In-Reply-To: <20181127134154.GM18284@habkost.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Nov 2018 17:55:02 +0400
Message-ID: <CAMxuvazzMc-6kREx2tpd7fz3KNAbc29JSLM5pATBpgnnrwsnAw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.196
Subject: Re: [Qemu-devel] [PATCH for-3.2 v4 10/28] qom: make interface types
 abstract
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
Cc: Peter Maydell <peter.maydell@linaro.org>, minyard <minyard@acm.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	hpoussin@reactos.org, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ANYH65o+x4m

On Tue, Nov 27, 2018 at 5:42 PM Eduardo Habkost <ehabkost@redhat.com> wrote=
:
>
> On Tue, Nov 27, 2018 at 01:27:43PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Interfaces don't have instance, let's make the interface type really
> > abstract to avoid confusion.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>
> What about updating the documentation at qom/object.h with
> examples?

I don't like code example in documentation, they tend to bit rot
(hint: rustdoc :). Instead, we can point out
tests/check-qom-interface.c?

>
> --
> Eduardo
