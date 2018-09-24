Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2674129wrd;
        Mon, 24 Sep 2018 08:47:04 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63W9XvjorENyTanLV4hz+JSjd+PLZs38XZ7JbuiYBd2AsIVM14AG4AzbGTE7ZeLTb57uuAR
X-Received: by 2002:a0c:8b67:: with SMTP id d39-v6mr7768669qvc.180.1537804024000;
        Mon, 24 Sep 2018 08:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537804023; cv=none;
        d=google.com; s=arc-20160816;
        b=LwRy8r4IF8n87nyiA4Aebvf6STTiJlUeLtaVG5LQMBOjlAyDYn+nv4UQXB2QWZs4MX
         vY1S0E0l/llCOpB1MpxUdENFXh/7r/ZRh6u9uY2rrYHJgqDJGlkhyYwRaE+8WGli+qNa
         wiq82zjLe5gTsHR0j/AuCAK026KERol0Nck6KZbt9iS1zA78JHuxUunKSg2htCUYRVqF
         TlplV8FBVidmVrru0fFcf0k35iqCgEwws7GQ914awAJbI/PgMp+hiA2DUeQKUqZCAh36
         6c+4CsRFgCkiVlMDNbuXlFyjvsHzzywRNfjzjrVHzygzdV+4qYcs5Q7eVhV86jdjkrbY
         D5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=6o5ahxN8yukD1Q2Lsu35wBzPUZPLPRzrWmZ6kf6ZVUc=;
        b=A3TfFAd0K8WA4KGcyCwH4elfq/F8ZCH+AjH5byJcZKTiOoXQYJ1PtnHqg/IafzSzta
         H6PIPivaJmIWyWcSNwuEaiZytAjzZZ92aoVfqfUMiyFaNY9p/L6EQI2ynrLg2Cn6JAJQ
         5GxeOR0H8d4/ghZnMxPgrojIaB/fClMUEpfNORG2ssPjQxufHRyeB52q2wvnhO+LzeeC
         PvQRLiHw6EcXE7y2GFywAucxjvj14TguyB/QC1vH7bDmo/8RnlSBmqTwd9/1FzXblq4s
         IH5GYNtvqJXK1PYC+BDai9xDJnEphF42e/dAHQYJY4jxHb6YUQgyIr3/aPKQAHuM/Aug
         6zQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ST6VHXgg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4-v6si3242144qtd.218.2018.09.24.08.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Sep 2018 08:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ST6VHXgg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4T4h-0000t3-G6
	for alex.bennee@linaro.org; Mon, 24 Sep 2018 11:47:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4T4R-0000su-LJ
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 11:46:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4T4Q-0003bl-UD
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 11:46:47 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:42731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4T4Q-0003bQ-MY
	for qemu-arm@nongnu.org; Mon, 24 Sep 2018 11:46:46 -0400
Received: by mail-ot1-x334.google.com with SMTP id h26-v6so20292362otl.9
	for <qemu-arm@nongnu.org>; Mon, 24 Sep 2018 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6o5ahxN8yukD1Q2Lsu35wBzPUZPLPRzrWmZ6kf6ZVUc=;
	b=ST6VHXggWmNqWh5DFGzKKtC3EBVaRi4SMa4JzWS4l6UIguuUYP5fE8CWoP3JhhFMMK
	AUeU0V9ioPwEZkus92mThGshQWYrF34RSNcEANQ6VZmoPtqhIn+VQwvA/UY9NhgcoXd1
	N4sXCq7x3qClLXq1u1wma0ChM6KlW44WuI49g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6o5ahxN8yukD1Q2Lsu35wBzPUZPLPRzrWmZ6kf6ZVUc=;
	b=rW4JIIsuSk1wKE9O6ZMhiVXVK5xXTNPN5PbZMzHk7+N8m1K579AytMcO+HCF5Wc2hr
	6eFODL6IlyAeFws3qzzrNHTkDkVwz3Ww9hiLuhHU2PSYYMuywrT1qbIvL4kvrslBRgVi
	qdxcW0bS6yamYQEdrB7G5pC0E+xZTprufPWXuG9UpZM/TbeqzYAWJwbhroKARaRVd7La
	AAW4yb4k32FBog+vqXtz46ypqPmawPAJOy4z6V2/7le8s1QiOXtxLV0n1itXyKcaK7ux
	pmpt4EoyyGZnUjxUkP7h/3Ndh8HU576QDXMwHjHR6zmax0xdgztjZb0BEtL72D/m7fuZ
	7f6Q==
X-Gm-Message-State: APzg51APJiBDKrBcJJX3G/MFS3lHaiI148T0vLnjTAyd+zg3YLGo5sMW
	KEzmEALlQmn9XarSJnbie6a7KzT+a0VrZ2PqPEncwQ==
X-Received: by 2002:a9d:730d:: with SMTP id
	e13-v6mr7398085otk.203.1537804005838; 
	Mon, 24 Sep 2018 08:46:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Mon, 24 Sep 2018 08:46:25
	-0700 (PDT)
In-Reply-To: <20180903065745.23055-1-kraxel@redhat.com>
References: <20180903065745.23055-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Sep 2018 16:46:25 +0100
Message-ID: <CAFEAcA_d0vNtpEfuusXEJNLSddP-htr1Ce7ruLzyVb6Q3dDdZw@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::334
Subject: Re: [Qemu-arm] [PULL 0/5] Vga 20180903 patches
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tQSd/pBCd3n9

On 3 September 2018 at 07:57, Gerd Hoffmann <kraxel@redhat.com> wrote:
> The following changes since commit 19b599f7664b2ebfd0f405fb79c14dd241557452:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-error-2018-08-27-v2' into staging (2018-08-27 16:44:20 +0100)
>
> are available in the git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20180903-pull-request
>
> for you to fetch changes up to 8da132a56f7ebaabc5b674b5a3a2e6fa8934be45:
>
>   virtio-gpu: add iommu support (2018-09-03 08:31:57 +0200)
>
> ----------------------------------------------------------------
> vga: virtio reset fix, virtio iommu support.
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM
