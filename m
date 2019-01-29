Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4870100wrt;
        Tue, 29 Jan 2019 12:25:59 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4OvHyY2gemTZ5iVn1kzljROAuQlbu6AkHeqRcq31N8617bOUOPstKWMlEoBR5mAuONVddL
X-Received: by 2002:a25:c202:: with SMTP id s2mr26881596ybf.392.1548793559843;
        Tue, 29 Jan 2019 12:25:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548793559; cv=none;
        d=google.com; s=arc-20160816;
        b=FgN0CKZRYl/SMKlG+bqTpeq01RvkMYKGiJevZxKhVlxO0aOomm/pD7Nm9HhWK0DYgy
         u+XI7CKNCoTQoiAV/LhMWA/p/L4zpMG603z7eCf9w31S65V5kqy9D9X28ugrR0e2TQca
         a2KV3q5DbpqOzghXHaZQKgsY9VIX5YsudxyLplcPuns/EuPm0/lS6+ZhqmD/Jtej+bIa
         V7flSo6anxkX70KgfcIAaR/Ng0WNoVujNeQTTDtoIJ9CJB2UDk+8xuLr+e7VE+hr78sd
         MeeVLRCncAea3vLyZh09ZevOTlN0/eWLi6VRLFYJ8EIAe5UVJuYzB47hGG+puCmUEyvf
         Yr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KnHPxVFNoAyckEri4ksdxwWrYuG3PfP1uvMuf+q6cBQ=;
        b=z7guPJGkbDboMJZ4At6Y2AyyNYOmJr3AarbQjTQ7+y4I9W+yiA6QMpan5hv6ynEQrV
         2AVjE3fXXWNxc5MQw60fiLv/akjvgyyS1Yg2XJ4wveZ9zDBrQFR7oxBNg9UU4FuSulY/
         YTTHGg7FjtodtFSFTnvL5F/C/sJk7WQrjYiUftnODMMCMoJ0aGLJrOC0RRTGLgGYrFfh
         OTy1gKqgq3h//IdmZlMCjetJXs76Zs2XEpErMPirKE42Yi/aWYuDMaXot5Jk7m3ZZGcP
         D32neWCKem0y/UJuvcowxbrFPfgIqgqFi0L8/pEzsFzP035hbYSrzdlYVfuZ/52KsZfB
         xdAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="TfX/ho4U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si21291469ybn.179.2019.01.29.12.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 12:25:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="TfX/ho4U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:55136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goZxH-0006cz-8m
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 15:25:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1goZx7-0006bg-4F
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 15:25:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1goZx6-0001Tj-Dq
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 15:25:49 -0500
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:39283)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1goZx4-0001Sn-GS; Tue, 29 Jan 2019 15:25:46 -0500
Received: by mail-yb1-xb44.google.com with SMTP id s17so8710476ybp.6;
	Tue, 29 Jan 2019 12:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KnHPxVFNoAyckEri4ksdxwWrYuG3PfP1uvMuf+q6cBQ=;
	b=TfX/ho4UHo/pB5iyFu38Ze6o7gfIXtuBg8M9AnkfONHnJZyTDFA3to7LDhD0ke3x7x
	op4jsqZF7ux4ZvlkPPbMclJ1c1e4VQ/QhPYf+8FfyO6nV2ZJZMWp59QLuaDDmkkyJf5J
	UY+ssQTlBkV9RbLMVc4JL3F+UtYh6dIvlAElNFJUwPHbOCdtEJ42q+EDPbBPVT8I9nrh
	5DezVTzMBulAImLqj/S2cNOHGvtoLtbNGb74t0W0/kz3quFlPtywat5ansiJDoWpkjtl
	0/ZUuKN4pfAZFi2v7//TmACz5ube2j+Fj7DRruQd0uB7XYtQWUXQQU9PIdUwaKLfucOl
	k1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KnHPxVFNoAyckEri4ksdxwWrYuG3PfP1uvMuf+q6cBQ=;
	b=IjO1SpNfoyXrhNkhJDtlcn6wjX+RauAQMxraZ5PnQqlZSLchm+3fgyZQ/GEQPMZZXA
	VYvIc2rs5vOpQ3IH1jmJ87GjwUZd27G+kap+i0tO6Y+928nyY6pcclCVB769uVaD7QnH
	Hd8UR3YqOREuq2QmQg3IUgh9AWNhIpfP4xNxLYKaLuUL5D2r2sPwdEy+U8HI87Q8EtBh
	3YcFC5OqFXupN4P7+n8LhchWWlhEHdJtAj5KJSBlplh36HwyGVwzIaXll/SiKCo5DA0D
	PvmM4OwGrR3XgsOD3SOo5CS5thcb9l6za2oWTfSBQGYDfSx9wdLmcerQV9NFOHd6nfax
	GfJw==
X-Gm-Message-State: AJcUukdjum052QCQiqiOUFhTio7q1sBpzIlRz6VhCG1R18lwLRPg0BO7
	cIYejhIUqXfRV2ZK/2D3zWzQOd0IYiZT9i6vQVg=
X-Received: by 2002:a25:3788:: with SMTP id
	e130mr27320757yba.399.1548793545556; 
	Tue, 29 Jan 2019 12:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20181207090135.7651-1-luc.michel@greensocs.com>
	<20181207090135.7651-8-luc.michel@greensocs.com>
	<CAMo8Bf+siB=vdjK+WPKvRCqKS59OVGOcAoH0HtN6VSvFyOc9gQ@mail.gmail.com>
	<CAFEAcA9uVMs8aGTcbUpz+EGGyFBXtCNVMT-_t5eYPBjJF_4Rrw@mail.gmail.com>
In-Reply-To: <CAFEAcA9uVMs8aGTcbUpz+EGGyFBXtCNVMT-_t5eYPBjJF_4Rrw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 29 Jan 2019 12:25:34 -0800
Message-ID: <CAMo8BfL7AVGwmXnBVf_RN8eUBshv+fYrkFhgZQ5UB_4bJ8Ss0g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b44
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v8 07/16] gdbstub: add
 multiprocess support to (f|s)ThreadInfo and ThreadExtraInfo
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
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel <qemu-devel@nongnu.org>, Sai Pavan Boddu <saipava@xilinx.com>,
	Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LjXpQg9I7MJq

On Tue, Jan 29, 2019 at 2:05 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > Starting with this commit it is no longer possible to kill QEMU
> > with the 'kill' command from the gdb. This was a nice feature,
> > was this removal intentional, or is it just an implementation
> > bug?
>
> That sounds like a bug. I think with the multiprocess extensions
> available gdb may switch from killing using the 'k' packet to using
> the 'vKill;pid' packet, which we don't implement? Looking at
> what gdb is sending ('set debug remote 1' turns on logging in
> gdb of remote protocol packets) would let us check that theory.

That's correct:

(gdb) kill
Kill the program being debugged? (y or n) y
Sending packet: $vKill;1#6e...Ack
Packet received:
Packet vKill (kill) is NOT supported
Can't kill process

> It's not clear how our implementation should deal with being asked
> to kill just one process if we have more than one, though...

I'll send a fix that restores previous behavior in case of a single
inferior process.

-- 
Thanks.
-- Max
