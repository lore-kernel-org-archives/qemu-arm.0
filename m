Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6341494lff;
        Tue, 17 Dec 2019 09:45:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3qRiAM9/fAKuTK7q44RDrFIrnXk1EYhwyHCMxp8LkRDUcPtwngY5onZLU7orm+VqfhnTQ
X-Received: by 2002:ae9:e41a:: with SMTP id q26mr6434108qkc.288.1576604717091;
        Tue, 17 Dec 2019 09:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576604717; cv=none;
        d=google.com; s=arc-20160816;
        b=qsBzCSBmd1Onon28teYPRn5P1gMf45LVPMN6Boxp8CXDRZyRrZqXLCgUxtawaOpbLp
         HRNj2EV2UhBnHOB0iviU4PH74VyFDXKQYePhBnkUVLz9QB0qLxVKQBrGst/xle8S59LR
         FiRs5FuTpVNAMjxr+Uxo0bAI4muNTBmu/ttNpBqh7Ct9Xtc/P/QRuRmmy6XfE/LRYCba
         imvUP0HPYx6JnMN+FSWpvx1J17bbiD36dvT+75qiilASE/2b/d2nhKvQYWQUQUqUHfPF
         GwLX2nG+mB5xiGssBS3JbiFSd/WSU56q8T5w7h80O5X+L1DARxWGUp5NmMXjU9ApN2yD
         weUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=otHh6o7oxDp9j6yghQWHjKyedFvOrFKCAiJYw7JbOso=;
        b=r4nw4PlQe3OfxbSECuOcuwbcRY/rpXG3F29IkYOYUaae0ZkBa01yBiQbKapy/mJLtU
         KgvyHXNLqX9YLnqMAFqhhkNbrxupYoFKU2OLnvsBe4IssMAU2SRRCJizK/HnKwBfX5XP
         1NXiJQrVCnKkeDQRo7yqraLEGvqItSXN9C0JRIt4z/T/duSNtZMIqPwY5y8VS2AI9USr
         hYYIOqXQBCn+zCtgPnBV6walSxrMlkMrvhg73myh6IdVq8Vg+vcrlV4XbnmmDPssZycy
         156kO2W8LrdfQW8pR5Q28btXiKwUW/Q7ITK9ph03H0Dox2eS8lR0vefqYpdWl3Cbk9sR
         b6tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oa4el7hg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 83si12653533qkj.334.2019.12.17.09.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 09:45:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oa4el7hg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihGuJ-0008UF-P2
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 12:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49932)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihGpA-0001nT-Sw
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:39:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihGp9-0000w0-Nw
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:39:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37892
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihGp9-0000uE-Kq
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 12:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576604395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otHh6o7oxDp9j6yghQWHjKyedFvOrFKCAiJYw7JbOso=;
 b=Oa4el7hgorSjs4LQAij3xLR9HJMV28e4dAt7bzVWEeLCROMJLXpXYA17q7nocuSY+Nw9he
 EfwW0z9yeeNg+/0LSTdF1Iax5ydqg3rv94bfHRovb1A/vRk05ahXwK5YoBCpetGyVKbVRO
 FgYfDeajgSE9KoDFfJj5FSUlagdyiFc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-S95hVrELPPG_9zVvc3ou5w-1; Tue, 17 Dec 2019 12:39:52 -0500
Received: by mail-wm1-f71.google.com with SMTP id y125so1005783wmg.1
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2019 09:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bAAJWyVVZ1IKai9f9il7x2Z+RsApLRgS+QHt3wBYLSA=;
 b=igHjmBG+JTQYvBdZHd9mbTO/ftqGufTyOlyCPpQVPDFCBCc9LK1zJp1TkwF+01opyc
 8dYF94Hh4qg9POLWZHZpM1g9jSfQvLJZsNGhTr9HzgjSSeOrM5pJC4uESlYLqsIUtekC
 p+iLByVAxZJoXrror5i8eeks9Es6oYoxw/gqC6VtG0dKzMAueyDQAnFxDigc9BPYqZ+E
 InHp6EGBQ0M0j7YTLEEWlUmQ+PHFxJHCm1wllLSX7sMbxTCewg8XfQZfkUQqdo+P4Y4o
 1egm3Z9tSuVq+lljW52vwvYvnj3qwCZ2KnL2zSp2hgMkq8R1KMVstNEZgOvuzoY4HwQW
 jYmA==
X-Gm-Message-State: APjAAAVpn/wa3dO0rdqbRmJJmWtmj9JCxdseVcQxkIx778fQ3FWgv9Am
 70mAB7IMQ7iP+jna6iMS2pFELCVeO+a8yDeTjUPElICKSbX8rEdLedKOPbQlz3KfmQ4Vy2YSoE8
 pmA6v9LOZhaQl
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr38388336wru.40.1576604390831; 
 Tue, 17 Dec 2019 09:39:50 -0800 (PST)
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr38388290wru.40.1576604390534; 
 Tue, 17 Dec 2019 09:39:50 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id h17sm27417449wrs.18.2019.12.17.09.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 09:39:50 -0800 (PST)
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
To: qemu-devel@nongnu.org
References: <20191217173252.4672-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6a8266c6-7c6d-3139-249f-2dd46c98e02f@redhat.com>
Date: Tue, 17 Dec 2019 18:39:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217173252.4672-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: S95hVrELPPG_9zVvc3ou5w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1M+X9oGMCkWK

On 12/17/19 6:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix some trivial warnings when building with -O3.
>=20
> Philippe Mathieu-Daud=C3=A9 (6):
>    audio/audio: Add missing fall through comment
>    hw/display/tcx: Add missing fall through comments
>    hw/net/imx_fec: Rewrite fall through comments
>    hw/timer/aspeed_timer: Add a fall through comment
>    hw/scsi/megasas: Silent GCC9 duplicated-cond warning
>    qemu-io-cmds: Silent GCC9 format-overflow warning

Sorry, this series failed because I used this tag in the first patch:

Cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Then git-send-email was happy with --dry-run, but then failed:
(body) Adding cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.co=
m> from line 'Cc:=20
K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>'
5.1.1 <K  v  g  >: Recipient address rejected: User unknown in local=20
recipient table

Note to self, enclose utf-8 names, as:
Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com>

