Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4053665wru;
        Mon, 30 Jul 2018 10:59:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcZUnXYZmef6sXS/xi2ouzO4km9Ed3Pm1op6aRcPS2xe/P67bMvANEAXMHITmAqXtdS0DNV
X-Received: by 2002:a37:9cd2:: with SMTP id f201-v6mr16575369qke.154.1532973551756;
        Mon, 30 Jul 2018 10:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532973551; cv=none;
        d=google.com; s=arc-20160816;
        b=0yVm1BRPM0mKMPDbHz++pbpd2nUTWFaaZdZrMa8K58aeYHTIw5Ll6jPqXXjEyRZPYd
         Ewb/F9+7esJLG6uanvZwmnwDp00kzHVJcYGPknx0yu97sYIpODNu1PsOHjxsLLXtZO3T
         GzwvIsGKyPwNyn+/S2GOozXf2ejZCSWgBJFriW6Z4bKXMit/xlSff8Qb6GKD0HQwtCah
         CkJyPIZsYjkw7V5KFn5bUSaB7vKkBfM+Xi0ZWKMeP9HnTwX2ZNnsXWNzOq4qjG3R5FsR
         /zaR6qNLviJUYJAs2BKdS5E8U8ZWmS7Aw9u19sUGuPZEL7GGAV8MDtWRepZLizrZkfTR
         4q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Okkf/Qq0kg4n2ajAlkMYmdH6mn8McLAbzMNoWRPb2Gs=;
        b=dz3gMsg3iZw/4Co0X+k3/zHmTia8WXfW5dDWngBRK+QK5yx9vbzgi43h8qmJA+V9tQ
         xBbfBHz9TT8MpOLGQYGt09TBjAtE+2KzJrRt//rxratkV+4/76j3+UQxAdBPm7aRaOVN
         OReePMSTMzPnI7c6NE/bH+hfAhSDwxqsYq4G9hWDgvnqoPPzt5TccR6UkHNblDW/EsK0
         DXz4u+JuRWF7uH8Eyg1/oS6vACT2UWg31bmMN/GTCNORt1C4zWHfXwpoHm4F+/RyjfiH
         yoBp52CXufck248NukW/E4XJ1NE22Rm0U2iwEQQIEog4UIsr2Lu3ZCA/Ih2vLgBqQNWx
         RWfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ez5QnpK6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q51-v6si12143505qtj.66.2018.07.30.10.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 10:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ez5QnpK6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkCRr-0001TU-AL
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 13:59:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkCQK-0000Qy-7Q
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:57:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkCQJ-0004VJ-DX
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:57:36 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:33141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fkCQJ-0004Uo-0K
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:57:35 -0400
Received: by mail-oi0-x243.google.com with SMTP id l10-v6so22906118oii.0
	for <qemu-arm@nongnu.org>; Mon, 30 Jul 2018 10:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Okkf/Qq0kg4n2ajAlkMYmdH6mn8McLAbzMNoWRPb2Gs=;
	b=ez5QnpK62So7lrObYVtVFBlVybcpd+ItbhDPaJZy9C8cdt9C9rGreqQ+pmUn+KG0Kh
	cqM/aAibQDMyujspkrc1Oc0drtKNWJ018yhY2wM+Lxn2LjLd7ZRI15BUAkZIktSJ/ulX
	3PkxonXrZtJRO/Hfnu14LTzBuTZPU9Pu/2RB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Okkf/Qq0kg4n2ajAlkMYmdH6mn8McLAbzMNoWRPb2Gs=;
	b=jHcZeSvvLKON1NsKSXHQe10hcwyf5uqTnNeSkRPBF66LiR2R7HJT8Eb+23Nh36lXC2
	YEddthPw2QusWJGgS7afyUsrz6UUCA/cWgbRR9tvxbxNpiOIVv4xRy5U0Nkb2iZY5x9R
	IRydoHSyYrNEGxPcAyRxw6asUyK+9H7bbVb3tQB8BvXcqdlzmPq+IQmqiABe7HWGgoM8
	uTZ8iF1T4GTaSKr8HLvVPpBcwRs4vt75/WFpo3swwcLWWe3pG3xiEMyuqtHE07o1Bcap
	HWOhW8yMUaKXTLhhErKkoMgc0NPGcdUdvMps6N8MSAAUUGW9O9sN0qyiriKV52LsDPhT
	+KtQ==
X-Gm-Message-State: AOUpUlG+nk0kyXbZuynhhf+DpGZOsLPk4sqMWqKqdTvP11JW9gJgNmeo
	3/5WbLcBH3b13vhzJ0528yjV2019y5J969dY31LonA==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr19885110oie.80.1532973454289; 
	Mon, 30 Jul 2018 10:57:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 10:57:13
	-0700 (PDT)
In-Reply-To: <20180725085944.11856-6-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-6-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 18:57:13 +0100
Message-ID: <CAFEAcA8N26yjrLeaDzkoJfx50Rd5h_y9hHVA8W19L9q1EOhfMA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v3 5/7] loader: add rom transaction API
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AFBwJdKD7V+r

On 25 July 2018 at 09:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Image file loaders may add a series of roms.  If an error occurs partway
> through loading there is no easy way to drop previously added roms.
>
> This patch adds a transaction mechanism that works like this:
>
>   rom_transaction_begin();
>   ...call rom_add_*()...
>   rom_transaction_end(ok);
>
> If ok is false then roms added in this transaction are dropped.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> +void rom_transaction_end(bool commit)
> +{
> +    Rom *rom;
> +    Rom *tmp;
> +
> +    QTAILQ_FOREACH_SAFE(rom, &roms, next, tmp) {
> +        if (rom->committed) {
> +            continue;
> +        }
> +        if (commit) {
> +            rom->committed = true;
> +        } else {
> +            QTAILQ_REMOVE(&roms, rom, next);
> +            g_free(rom->data);
> +            g_free(rom->path);
> +            g_free(rom->name);
> +            g_free(rom->fw_dir);
> +            g_free(rom->fw_file);
> +            g_free(rom);

Is it worth having a rom_free() function so we can
share the "free all the pointers" code between this
and the error-exit codepath at the end of rom_add_file() ?

Either way
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
