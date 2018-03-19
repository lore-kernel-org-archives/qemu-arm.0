Received: by 10.28.91.67 with SMTP id p64csp2917214wmb;
        Mon, 19 Mar 2018 11:26:40 -0700 (PDT)
X-Google-Smtp-Source: AG47ELucoXrRYSJLWFENmw6qJhlsKzu6vXrqW9XMcB/gbQBHGADNaMQmEcJVr3s2m8qutcyK+NQZ
X-Received: by 10.55.78.134 with SMTP id c128mr19478555qkb.226.1521483990833;
        Mon, 19 Mar 2018 11:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521483990; cv=none;
        d=google.com; s=arc-20160816;
        b=JCg7KYGsnoXr2PKS05hnYNxgQZebFoZvuY25JkkdIcr6BBfhNy6coi4qHiU1768gUg
         hnhxnq3a3xzSjg64pNLOy0Z7bNkUxn0q1WXaisoMl1c9AU6vPvB1hLuPbtcVkYHahnjR
         A4fq3lBIyAw0cTdBSnghpfQ+/AH0wj6b3RpV9aZ/XABFhKQra7YtoOmPAY0ryWKPTOUN
         VTp6TDAbG7yrMkH1l8OglMni1Ksd0zfg/Da9D9F17X/8vY6kAWqx/4niMDX1WLNckpV8
         Yj29CCy8hXbDkG1bQHWHubNpiSC5ALtYevYKzC66ZTpcVzofno6p/hxvydtO5wx0I9Cw
         NQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VWW48g6ptMqcSShPK7GEVqYgPkxQX41zNshutNYZ/F8=;
        b=knlPzr18ZENu3F7SshUbYiCGTyO94/qFPlY9RCmSn+6wauNW/DIXMjVy86sW3p741l
         Bn/nx6UyRF4/brYuu0XKADrfM8bA660u4mLnhkn7K/ceYvkUkxp0i85Lr2a+OdAPxG7M
         RZlgJ6ynuNjN9WtEUjOznll7bpErn2b3v4f7DtrRjQMyG4+ekQ8j/aTgnrJqt0sw3fRq
         fAj+uR4G6Ei90VN46fKQOc7cTatZahVdKLf89c/6f7BMMIRc3gPctrGa3s4zSmiFjBm/
         3nXEtcq68rjKcd7yPyd6x+D6agG6BQzA7eNnDVj4Gc9zh7nPy97BAlXtbbPIHTaPwSR+
         nXFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hmcj5Sdy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q84si623407qke.105.2018.03.19.11.26.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 11:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hmcj5Sdy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exzUL-0008RP-Np
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 14:26:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exzTN-00088m-00
	for qemu-devel@nongnu.org; Mon, 19 Mar 2018 14:25:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exzTL-0001S4-Rz
	for qemu-devel@nongnu.org; Mon, 19 Mar 2018 14:25:29 -0400
Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a]:46710)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1exzTL-0001Rf-ME
	for qemu-devel@nongnu.org; Mon, 19 Mar 2018 14:25:27 -0400
Received: by mail-oi0-x22a.google.com with SMTP id x12so15133506oie.13
	for <qemu-devel@nongnu.org>; Mon, 19 Mar 2018 11:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VWW48g6ptMqcSShPK7GEVqYgPkxQX41zNshutNYZ/F8=;
	b=Hmcj5Sdy2yxtW5gsgF4wgVSFkjxqaK6gyWhP/vgwRLF44zZPallin9rTS5rZtSvfeV
	VHimMyuUPL5IHLGBMc/NuA7ZdWOEMF4KiNJLt4auyL751Kn9EaLfWuSKxZVSLH9iW5+h
	XfrMMjEWcPxvdRl3WnY1mhpNJ+KzKbDE8Bn5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VWW48g6ptMqcSShPK7GEVqYgPkxQX41zNshutNYZ/F8=;
	b=VPxAkjBcQKd46/vVZsDzdzqc+xNjltEHDAnVOFJmHAHASzFw8HECWBz4vqSGyOdfii
	32pho/HoTkc0oA6C2tKzza+ireBezXJ5P2pOZ8/jIaOHoMLr3t8VG7lR8BoqHLU85UsK
	oNlrubntT7hSz7YBxRSQK2GIALO3GeeiYMLpYBSV9+dxS6WnuzidpyLfprfA/TKXHLw3
	FhG3sfpynFfGJYh17yGUOxZTP1M8GYzHrtN6Ev84hmizfjkHVN7ky+ApO7+C+ShqURzQ
	ulRqNUgGcvyE0598GHpIP5bgqt7NZFEX03FmS/zdp1UtW0Oh1RZdjCciwmtPO651feba
	BFIQ==
X-Gm-Message-State: AElRT7GOW34HsYFYcsbujMMowNjlMl1U1mVOrolu/8BA9/9/r0uBrs0M
	CUipC+SdYLSrP/g5lGveWYEWesS5tr5l+YNL7A2U0g==
X-Received: by 10.202.63.85 with SMTP id m82mr6190582oia.252.1521483926958;
	Mon, 19 Mar 2018 11:25:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 19 Mar 2018 11:25:06
	-0700 (PDT)
In-Reply-To: <20180319154020.6d668399@igors-macbook-pro.local>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-9-peter.maydell@linaro.org>
	<MWHPR21MB018983B74A652443B70680F19ED20@MWHPR21MB0189.namprd21.prod.outlook.com>
	<CAFEAcA_9YQ4bSzHgM8yLAPtPZ2C70u13kTCLf4rHGPCBUgNiZA@mail.gmail.com>
	<20180319154020.6d668399@igors-macbook-pro.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Mar 2018 18:25:06 +0000
Message-ID: <CAFEAcA9fnw90pV462Aa5CYYdrgKAYG1RsuQbXHEd-5PcnXjE4g@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22a
Subject: Re: [Qemu-devel] [PATCH 8/9] hw/arm/bcm2836: Hardcode correct CPU
 type
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ok0d/qp1ltmq

On 19 March 2018 at 14:40, Igor Mammedov <imammedo@redhat.com> wrote:
> On Thu, 15 Mar 2018 17:13:03 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>> Igor, can you help with this question? For a board that always
>> has one CPU type (because the real hardware only ever has
>> one SoC, and that SoC QOM object hard codes the CPU type)
>> does it still need to set the mc->default_cpu_type field in
>> its MachineClass, or does that become pointless ?
>
> Since board ignores whatever were specified on '-cpu' and
> there aren't any checks in board code for current_machine->cpu_type,
> removing mc->default_cpu_type won't really affect anything.
>
> With current code in vl.c and with default_cpu_type set, user will
> get error if he specified non existing cpu_model with -cpu.
> If default_cpu_type were NULL, -cpu is completely ignored.
>
> But once http://patchwork.ozlabs.org/patch/870297/ is applied
> it will error out the same way as if default_cpu_type were
> set since vl.c won't rely on it anymore for parsing cpu_model.
>
> So in short it's ok to remove mc->default_cpu_type here.

Thanks for the explanation. I think what I'll do is put these
in as-is, and then have a followup patch that cleans up the
default_cpu_types from raspi.c once that patch 870297 is in.

-- PMM
