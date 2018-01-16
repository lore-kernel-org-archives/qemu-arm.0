Received: by 10.28.173.206 with SMTP id w197csp4072802wme;
        Tue, 16 Jan 2018 07:21:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBosk3fg12wbdAFFUBq0xRdSrf1ZXfVVcdJNN6QcSBCmWKqtLsEi3ShgbSPrLzjJNS9U+B0GA
X-Received: by 10.129.238.14 with SMTP id l14mr34926448ywm.237.1516116115814;
        Tue, 16 Jan 2018 07:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516116115; cv=none;
        d=google.com; s=arc-20160816;
        b=io8AGIzusBVlqSafE2GOyn1MNR6tZ7raR4fFumOUw9yYu85NfJLr9d3DteIzjtG8n5
         6gLUCoEoBiod3luA7l5KhfrD7cXMYX0st1xIyr45YSlrIMm8nH6dyOhnzWsymEmEIoLY
         iWaBmOWYlnTX6lI61nt4jWQg3P7kG/bpDgtTXgYt4huxAKzss0vWBbXYmcCe/PodaWFE
         zpyxgnTR8HYauXtWgX/jJUUkclqMaaiung6GxUJVOFTDsFlEYV/4p+J1QFfU4mFZ+Zsn
         mEcqcDb6G9JXYW0iUY34xdrIr8tgh/qAFpiAtLyOxEX6pPC0fCgWsjInYF/jX8+AKYO/
         P57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=JCcsZNNkOXyX5H7DikrpMtYY7/+IdtKQyplx7/q0I/4=;
        b=D7Td6kSQAIQ+sCx60NyITi88KRmhXK/R0G7DMa79sd1uieWMh7p4b7kPqtxnvPXdhS
         Is9gK4bBFXTp2oi6S95zduqsreUSy+zhIbfQioAAyU3blbcGl9qsQSy/pDo2FeARHp2s
         F/bVuj2MsCkDrhWEn/GByK4l43an6wCR0BS5/uU0Pht5R1FJ3EL51YIeK5nvhZ3a+7Ur
         jpbUj9XICYSxGBuApuC/D3hFiVCUuj2uJja3t6yhtUkF/6BZ8olQNRoesF8MEVTgCGm4
         QQXJUoapApENsctRcgZintkZKkB9gr5HvWlDxRiwYR/AtuGkWTrtuS1HdzG74wH77dNP
         paEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=haDwbT1V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a15si574230ybc.324.2018.01.16.07.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:21:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=haDwbT1V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebT3j-0005q6-6d
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:21:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSEf-0004KN-7b
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 09:29:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSEe-0001vo-Ao
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 09:29:09 -0500
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:41929)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebSEe-0001vT-6P
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 09:29:08 -0500
Received: by mail-ot0-x22f.google.com with SMTP id 44so12851683otk.8
	for <qemu-devel@nongnu.org>; Tue, 16 Jan 2018 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JCcsZNNkOXyX5H7DikrpMtYY7/+IdtKQyplx7/q0I/4=;
	b=haDwbT1VQ2ErLQ3mVAV9Bv6NZfwldDxXh6xJwhKpUr50EOC0PfY7T56tWWA1Q3uw0A
	MxOGhkyEzokzteKZFv7w4E4fOUi8IEsiy1QcWXeoIQa5zRnV4AqC6Cr7MGxJTGFhmsaT
	CsMHf9ah8QAomb5GbLOJy9GoA8iH9SLa5PdNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JCcsZNNkOXyX5H7DikrpMtYY7/+IdtKQyplx7/q0I/4=;
	b=cFjTK74apydPx7U6+TcVlZcu8hda7vtc6VKmQdtjbNDAh33O5NBjMrwWzo4dsUvDjC
	E8m/b7/fkLtw6E3oXHPFecEfMF2T/OphlIDBc5c3BOGn29zBjXuXRe0Rb7Ty7Hc6gVxI
	0+t8E95dKS4gFy+CesJnYIJ18qQ5KgFRpFnzIYM0ySJusj3ASXu1boyRWo0kb4AxudrD
	f0qpXgdgRBRlFmj1hWePufpKa7KCczePTvhTQmultxh9+gKwMilzjSXttRGcbBEk2Y0b
	7aktOMbS8K9rq9/ODLAUow49qa3gmwTGYq5o9CUGQZEdFyB9CZnXx8Xl6TzmlXUOYP46
	R9Vg==
X-Gm-Message-State: AKwxytfGN9HgArxz5lWstw5k2M8j00Bc2kVY7KWNP0bBmVAiOgF3dcQd
	ceF/z5YBRtdXuMvwKMi+/Ggz0PP7HkTsPGlejORpTA==
X-Received: by 10.157.2.175 with SMTP id 44mr20589862otl.335.1516112947538;
	Tue, 16 Jan 2018 06:29:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 06:28:47 -0800 (PST)
In-Reply-To: <20180116013709.13830-4-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-4-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 14:28:47 +0000
Message-ID: <CAFEAcA-kpmTmBSxxdmDOEiYR_=X45t_O6MU-CBM85NLb22mNxQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-devel] [PATCH v4 03/14] i.MX: Add code to emulate i.MX7
 CCM, PMU and ANALOG IP blocks
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rSmQpjPkKbBB

On 16 January 2018 at 01:36, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Add minimal code needed to allow upstream Linux guest to boot.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/misc/Makefile.objs      |   1 +
>  hw/misc/imx7_ccm.c         | 277 +++++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/misc/imx7_ccm.h | 139 +++++++++++++++++++++++
>  3 files changed, 417 insertions(+)
>  create mode 100644 hw/misc/imx7_ccm.c
>  create mode 100644 include/hw/misc/imx7_ccm.h
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
