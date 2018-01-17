Received: by 10.28.173.206 with SMTP id w197csp5257811wme;
        Wed, 17 Jan 2018 05:21:19 -0800 (PST)
X-Google-Smtp-Source: ACJfBouwwNn3IpsGO9gUTs8nzAWGidzjXC8pc2P782dHW655povpq2+yBrt9kEcZDy0x8Klfy4rL
X-Received: by 10.129.4.80 with SMTP id 77mr652651ywe.74.1516195279525;
        Wed, 17 Jan 2018 05:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516195279; cv=none;
        d=google.com; s=arc-20160816;
        b=fPYKcmVxLuShhObyHIaMBjko5fce9QvU/F6xt5vZhgT31IBJ9P9U9nNc0HgB44Cu/l
         GIUOHVI/aUpVzmMHz3nw+o5SUzYRW60DV6QYiQEUik8iIaZ5eLWKwPQtcjrz8PkiH5v+
         +8Orsw9wXRuUdY+85RTqhB81nU1RGzkuvmyjfcHk6+h2JBLT3Lb+sEfH2WOalaivrpp4
         adDjW2VsSwloD0JoZHFHQ5LFNrgDN9fJrBJRUOVQmpHzOq83PE6ERtOeNevWjdljrtsm
         MCq+K2yZ/djVzqKBPGKJQ72KltNVzelOFz/CZ0kdNuDEZYCmPRs/T6rFNj+1Vv5qYWLC
         ZyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=jMTNfTWvksaaKjgjneKUcT22/ysgBnfq3TpCbM9M53k=;
        b=MVt387LdWJahz5eFt9cUZGJIVereO8sUADLfiNgR3XjtZTL72EpBjREX0hQVBi7szi
         QrhMOuBddugNJs27sQeHSC21a5BUacbwCDUyvcR0VmvWYJ2MhFD8t0Tcb9RpXImn9BHY
         gIEdUGVOV+NmzVIG6Bc3O8nIbfhx8c/RS1buoIJhSmAVNAzOCn8JNX3Eoze/zEAZiq82
         krJhA21+qd6kGYdBPs+8osjrdChYK1zW8fnA52GbFdOIpI82Z1e8qFnHHI2K7aGwWpVf
         tZG7npTeD/li3kcsV0AaF7VBlG55iMULRQD8MuVFX3+s1JYGaXIEUNtkl6neEfSgoiuj
         mnuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JYHhbQpa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h10si1219672ywk.695.2018.01.17.05.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 05:21:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JYHhbQpa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebneY-00060A-W9
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 08:21:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebne3-0005yS-LQ
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 08:20:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebne2-0001zH-PU
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 08:20:47 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebndx-0001nR-39; Wed, 17 Jan 2018 08:20:41 -0500
Received: by mail-qk0-x241.google.com with SMTP id d21so25168764qkj.3;
	Wed, 17 Jan 2018 05:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jMTNfTWvksaaKjgjneKUcT22/ysgBnfq3TpCbM9M53k=;
	b=JYHhbQpaXwXQOo2/0P9aZBoImEqiWbqav5407wSUA3MBlc0HDEkVMtlu4l3lkAJWnX
	SI4Q7pfDqfLax2kbXXD9D6v4h1mG7NKdvacEw09eX0fspEJ4MxhS4FtPaZchcqStpCSF
	n7hhy2qIs1dyEK2I1eK21XcfutrvEACDpHhe2g5etjfA34XNWaCmKl3SGPtQdB8aPli1
	jNY5P1Nbg6xdaQaFq+0aTzU+P1vg3k+fQ5v7ahEDWGD5SGc9mceOlQnX7a6MbHj31W8/
	Bi3Cm8BkrMc6KnI8/lDs/ylPWky14cMPJwirgOlZQiH9aQQWGHx9cjB65Vhf2v3+Xdad
	/r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jMTNfTWvksaaKjgjneKUcT22/ysgBnfq3TpCbM9M53k=;
	b=VIXu4UA1dVukYVa4wxP+bTMCMcUOcYggb70+RpBT6+SGPuRzJ9T4xJrfM5cDgcSZIJ
	QMjtmTn6pWuwmLy9cMWfD6m/MrN2TjX2Q+Xl9rzehwHWBVXCk6e2xuA8MOAB34nYVuy/
	dLw34TwlPG0dzUTjtA6QAlaQcDWHvOThb4PKg4MLnLmnDU32etopbOvMnoKbo2uOJFxz
	hvbNlfnpMUcmYUEd37Cj9VPEKjcZ0firT5gtjDa16wRvOWGKcKBQJX0o+rYhEjkWqqzY
	9/ei5vgoflRnG4qWKfrWLbKiteBMrhR5TlkNy8VG8TWaWQgkFjv4z0XUNLfnG/EO8ofx
	qI3A==
X-Gm-Message-State: AKwxytf8G4KHUAodMPQeBYKAjnlE+jfzS4+OvcSHWNMpN2BXoSfzKk2W
	tfLp1Tu1mO5NP2gmNJeHauWtNli6
X-Received: by 10.55.71.149 with SMTP id u143mr30750432qka.240.1516195240328; 
	Wed, 17 Jan 2018 05:20:40 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id q2sm2957808qki.26.2018.01.17.05.20.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 05:20:39 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com
References: <cover.1516144891.git.alistair.francis@xilinx.com>
	<d1049a00a3c00d8310584f7732492a2064a982ae.1516144891.git.alistair.francis@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b366c117-c4be-50bc-0c34-3e61c6bebb72@amsat.org>
Date: Wed, 17 Jan 2018 10:20:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <d1049a00a3c00d8310584f7732492a2064a982ae.1516144891.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v5 1/9] microblaze: boot.c:
 Don't try to find NULL pointer
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R4f/zULGc3h+

Hi Alistair,

Maybe reworded "Don't try to find NULL file"

On 01/16/2018 08:22 PM, Alistair Francis wrote:
> Previously if no device tree was passed to microblaze_load_kernel() then
> qemu_find_file() would try to find a NULL pointer. To avoid this put a
> check around qemu_find_file().
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> 
>  hw/microblaze/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index 457a08a2fe..35bfeda7aa 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -124,7 +124,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>      kernel_cmdline = qemu_opt_get(machine_opts, "append");
>      dtb_arg = qemu_opt_get(machine_opts, "dtb");
>      /* default to pcbios dtb as passed by machine_init */
> -    if (!dtb_arg) {
> +    if (!dtb_arg && dtb_filename) {
>          filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
>      }
> 
> --
> 2.14.1
