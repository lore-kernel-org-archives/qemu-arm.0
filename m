Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4158869wrx;
        Mon, 25 Mar 2019 11:16:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqweiePtXWc5a7pVt2PHoaFGuH99vd1NsSN191U8R7bUy35bZc+6MLGAA70iIlNt7WCjiP5k
X-Received: by 2002:a25:9244:: with SMTP id e4mr22437335ybo.211.1553537808174;
        Mon, 25 Mar 2019 11:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553537808; cv=none;
        d=google.com; s=arc-20160816;
        b=LCic6WkVccWUstlhj8JrQvpbVgRxRVb//9ao7ZijzOmNKadcdkG6AFj1yDOu4G/Hbg
         /wo7KWhgB9HkM118PB55O86C3HGg3V2PURpbk7b1+ZhgsQeLiWfZ64PtoeW2B+QxpyXR
         uWt+oEepyhGEQ8ttCFr9cmJ1079poozUsuxP3Rup+MM9LkZ6jEpcAKRYaQqUP0H/A4DY
         6Y/nI7yFzLNkh/QsGCUluvhDdybDUTKC0bUtlNzyUdQ8V3clphNYWx6wUCoPloWVrev+
         IffgBymlU12E6X2pXuFIjFYQNm4qUVuM9ueCLDLlubpdNSDDbT4hggvKCRYC7ChZC7N0
         twZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1HDtXpduAd/fSxWx6Uk3hiW6PKOR26DHkQGK22lVMQQ=;
        b=WPb8BPIV5B/0ooR46Q9/OTwKgtRaTFF5ZQcjXjJGT3Jo9mFd7bfpN5TYVFnYTq01IV
         JAwk37q8vfYL17oNouqAW4BaV5h+X5HKP5f+i0CxIiZFqATpMaRKKjr9r6XBFgdiNGLs
         loAL0FToevRMelr+/S0TQrji36Knhhid02OhJZmutOsD0o7kbm4zp+cD/qg6cH7eexc5
         Tt6GW2+Oqfe/cVAnPQ6OKcDTkFCqbCvAXajfDDXyf05Ib9G/gjzBjnICajdWNn0IoPag
         0IYyCeAZXt4iVaLep8orctTMhRZZikIfLhJ9BjYPKyEiTNzLYeC1DtXZHF7LxpwMYeyW
         a/yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ek17dVvV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b81si6836903ywb.321.2019.03.25.11.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 11:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ek17dVvV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:46498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8U9P-0007cg-Js
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 14:16:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8U25-00015o-UL
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 14:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8U24-0004rA-QR
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 14:09:13 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33599)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h8U24-0004qQ-KK
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 14:09:12 -0400
Received: by mail-oi1-x244.google.com with SMTP id e22so7744086oiy.0
	for <qemu-devel@nongnu.org>; Mon, 25 Mar 2019 11:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1HDtXpduAd/fSxWx6Uk3hiW6PKOR26DHkQGK22lVMQQ=;
	b=ek17dVvVoWMX1oCHxgQCXLynL17Biyv5apLPDnx2Xybp+IquMfa/mW7xmaF64/M3fs
	KCcur6fQZ1/pgGa7lz7HSyQPja60NE93BP6DOtbfJtEtQci5gwxhJCZqBK0RhJTSg84S
	iKpYpGezgVvA1htuigsMwAX3shLL7Cp6QTvMDZRxVNItWC6VKdETp0c9hS3JlZoFmsRk
	YfxO0gEl26Nd/uCwa7PoW4aM1P7I5pMlb7xWNroanjf9wQYJxBBs2KXgLNIzmAYhVu3T
	jv/RRMN8s+pURP41q8f9R0Lma5WGUMUwpmfZPJWnnqBbDwJYy2sXNodnO4w65op+KqeH
	e6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1HDtXpduAd/fSxWx6Uk3hiW6PKOR26DHkQGK22lVMQQ=;
	b=cy6pgU+uLz1Y1kI7OS4lcrLD8YvhaACJJjyf11Idj6oXmrbjkybYIMWdyFK2yNQqkV
	q0THBVJ1wCXKZu9obEieo5wcyx0xpEW8gvjXo4DaTLu9z3NyxI5U5Phdso0X8aI7mnj4
	ISftDcrcfbvfWz/r59toyxzCgdnsffsdKgpf0ojP67f4+QpojwlXKMTTfuLhCevWCLnJ
	/vHKZsJG+L336U5rEYQuelz+PiKnv5yrdtCSYvpds7BMCJcp37hKsYv8m4kajlQX5Hk8
	lt8isxtZPNbWmQWXnrAMdAMxI7ZtT+3IMRvGM9nN/nlncYP8nC7VcYSEulPCRu8JC38/
	JI+A==
X-Gm-Message-State: APjAAAU5ytGzLien61Dc1lVQlyIKBnyICEQKaHKGZAQ6RJOHiG0tJUxM
	4xg3D2RuuIHzkQUPvzD5xdPSrnIMzgRknBH/LqzAbQ==
X-Received: by 2002:aca:d409:: with SMTP id l9mr13043271oig.98.1553537351232; 
	Mon, 25 Mar 2019 11:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190325155857.10661-1-stefanha@redhat.com>
In-Reply-To: <20190325155857.10661-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Mar 2019 18:09:00 +0000
Message-ID: <CAFEAcA8vaS3u5wetjpmmaVQRKmVWK3+csQWUMAPd4DVcoExwaA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PULL 0/7] Tracing patches
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
Cc: Fam Zheng <fam@euphon.net>, kvm-devel <kvm@vger.kernel.org>,
	David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul.durrant@citrix.com>,
	Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
	qemu-s390x <qemu-s390x@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-ppc <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kQCwDLZYxUwR

On Mon, 25 Mar 2019 at 15:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit d97a39d903fe33c45be83ac6943a2f82a3649a11:
>
>   Merge remote-tracking branch 'remotes/ehabkost/tags/x86-next-pull-request' into staging (2019-03-22 09:37:38 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to dec9776049e32d6c830127b286530c5f53267eff:
>
>   trace-events: Fix attribution of trace points to source (2019-03-22 16:18:07 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> Compilation fixes and cleanups for QEMU 4.0.0.
>
> ----------------------------------------------------------------
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM
