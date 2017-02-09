Received: by 10.25.77.65 with SMTP id a62csp252824lfb;
        Thu, 9 Feb 2017 02:40:11 -0800 (PST)
X-Received: by 10.237.62.232 with SMTP id o37mr1965507qtf.188.1486636811114;
        Thu, 09 Feb 2017 02:40:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h62si7698386qkc.91.2017.02.09.02.40.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 02:40:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbm92-0006YO-IY
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 05:40:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1cbm4Z-0002Jw-3f
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 05:35:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1cbm4Y-00025Y-Ce
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 05:35:31 -0500
Received: from mail-io0-x230.google.com ([2607:f8b0:4001:c06::230]:36369)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1cbm4Y-00024W-82
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 05:35:30 -0500
Received: by mail-io0-x230.google.com with SMTP id j13so13373196iod.3
	for <qemu-arm@nongnu.org>; Thu, 09 Feb 2017 02:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iNq31rEqMkyh0vj/yFr++F5Wta/Tupv/D+WergSUSdY=;
	b=jy+K2JrT+E5tfAXoWqhlKaF0kiuIHby2f1IsRu+yspczAFRJpJpyIxytY0iBrwvXy3
	5+fJrsVLR4p7BT5YSr+gHhdOri+5nZ2MJG0Nhdpv8xDJrPV554nMYg6G2fp1sfuWe6z4
	iiHtHlD2fWztmqE/du3zntug1BsIE5J+zcfoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iNq31rEqMkyh0vj/yFr++F5Wta/Tupv/D+WergSUSdY=;
	b=WeYWGZnmLjBs0gWSy9xxgRvJE32HX1ZGPYj+kuavGfsUpGRc8TYUwB4BtRYPpULZIj
	DA7r+NPevYxFe18bbGkbhHZqc9Klz9kuKP7VXVKJnVWsAI8OUoTCZ+sobM5dQwetBwsA
	HmGACrfMwKfFKYpZYyDhgYnoW8hqO5IT77tgjwip2x7PPF/77i5D70rS/WaZuwVt4Tyj
	k4LLQx7wKYbSIETwabZ2QxfH7Q8qmaI1zGX6IROQF70Yu88OiQZMKXn6O97kiMVybM9Q
	JpgVS3lvijUKE1gRohW4yZg7DRTjxkbY3TY5k0n9P5IoR5tBSDWVbXZWfomKIIgRF2Ls
	beKA==
X-Gm-Message-State: AMke39mx4EBuLpNmhfBj3ldpbeV0Rl7B9AVdRCwbW6Y3ZXRFcorkp9fkcd0p5udIl7yDp+Ysr48IyBbgdhstKqgx
X-Received: by 10.107.12.150 with SMTP id 22mr2383497iom.138.1486636529411;
	Thu, 09 Feb 2017 02:35:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.144.139 with HTTP; Thu, 9 Feb 2017 02:35:28 -0800 (PST)
In-Reply-To: <CAFEAcA8rjjzgvN-RuNPVHM53R9V9xry1Uj_ArmF1va-Y920eBQ@mail.gmail.com>
References: <1486560712-44171-1-git-send-email-agraf@suse.de>
	<ef6b903b-5224-b4eb-1080-a3689fcec70a@redhat.com>
	<f2f119bc-9c22-ad52-ff26-7d6ecc213a3c@suse.de>
	<c1ff3829-b068-881a-1523-317ef0d31689@redhat.com>
	<C4E1DF44-1626-425D-880E-0053AD688422@linaro.org>
	<CAFEAcA8rjjzgvN-RuNPVHM53R9V9xry1Uj_ArmF1va-Y920eBQ@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 9 Feb 2017 10:35:28 +0000
Message-ID: <CAKv+Gu_HJ-MNZ+GPsroodWGNVm4z++CSWLUkPR6tro8jUh2zzA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Declare virtio-mmio
 as dma-coherent in dt
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3uJqXCeuWb1R

(+Leif, Graeme)

On 8 February 2017 at 18:23, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 8 February 2017 at 16:27, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> The _CCA property is mandatory on arm64, and there is no default.
>
> Is there a tool that can check this kind of requirement
> and complain about issues in the ACPI tables (and
> ditto, device tree)? It's really easy to produce a
> dt or ACPI table that works with current kernels and
> then turns out to have a problem six or twelve
> months down the line :-(
>

Perhaps Graeme or Leif could shed some light on this? I know this is
on our roadmap, but I am not up to date with the latest status.
