Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3820713wru;
        Mon, 30 Jul 2018 07:08:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpddIZvlQ2MDOvx53TACNNvXNFwSinLL1z2suWmM+xNmjuOVSndngb3FgD9r8fxURc6TToyw
X-Received: by 2002:aed:3d2d:: with SMTP id g42-v6mr16712724qtf.195.1532959695108;
        Mon, 30 Jul 2018 07:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532959695; cv=none;
        d=google.com; s=arc-20160816;
        b=PcMV1mG7MvylA+Vgu4kPI5+0IpwpWMa5YWN9l0MlhFfD+PybrX6fNgsNgWGMHjyIhB
         AiTYTB4FznAy+9/k0dq5DZRZpuyzbbqWS4J1BZO9MTNecESKRjU/7IHqS9xpZCNRAS2a
         CI8xJBmPZMK9pC57xazrlApWoSJlDFkrwDMpl2WGu0zv+ey8DXjjRf6vS8Zl/JH3C+0J
         iixMi01vBYeB9s+VNJ8w6QPaxQ3K3r5va6oqaO2UhhYnCAzlBh+kRmXymR8j0beeVSR/
         RCmPIjPfqZ2wZ04UhMSJ2jxQWQjnrXcacP3Pg+GpmUXYd8zjFe1m4XqkrgnZitgk8ro4
         PRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=0KQFkCRiSziJJggXJPfiEIqnGQeEC51C9VAe0ARSv7k=;
        b=DTzivCgEeooCkdVLPWbNueM8e6AFrapznevuwf3OfTaJ4jAtwk7Rejt1COVBCx0+3A
         kLzEPG9dpCLfS23cd0Bapg0A1UBYe9pqg4s/SS5rrE5WcW0JzxpzJP0LOR3yYc9JeDOF
         w4FI5yMHwvQ1cImiwzD9NbCfi9tT/fqEpjT6qvPsg8hVX9vw9mxjblREoesIudRBf9+/
         RefS5P6FpRHRVmcvY5GLeUaf7kLIq59AErForj1aYMF9F1aOU1BUE0mP3h4eLaTsX0nQ
         N+GXUeSs5dYTvsz2wXp/Z0+h8A7LaT27QzMHIB61XKRPX6MYNuEpqlUIRp7CKA0hzru0
         mhUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aAHtJM5L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s77-v6si2985986qka.49.2018.07.30.07.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 07:08:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aAHtJM5L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fk8qM-0002FX-J6
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 10:08:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fk8q9-0002Eh-AQ
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 10:08:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fk8q8-0002dV-FM
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 10:08:01 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:44781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fk8q8-0002d6-8T
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 10:08:00 -0400
Received: by mail-oi0-x241.google.com with SMTP id s198-v6so21440462oih.11
	for <qemu-arm@nongnu.org>; Mon, 30 Jul 2018 07:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0KQFkCRiSziJJggXJPfiEIqnGQeEC51C9VAe0ARSv7k=;
	b=aAHtJM5LfaIRiq+UK3xtaDJllm/6Zzs8JUUQUFvRRkxc+Mpniox08F3g3ee7bc1mS5
	tGjprA/OAgG7GcMOzwvkTWQCEEyZCIRRjvkVGgPHGYvcUeo3LgmiHUKtfAsth7ebv+h2
	wto1itmureI3CpjM4EscQ4N/QDvduFD8pa+ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0KQFkCRiSziJJggXJPfiEIqnGQeEC51C9VAe0ARSv7k=;
	b=I1qTcQ6Stn6x5og/XzupngyswfSTNwRp/JSbjzsY/GY0W2XJb+Kb3NpJ8CxewyZC1f
	ixRD+XKv7WEobsHIXoJwFFdTDh4sUUEYyulzOmpaSz6rEaUUMPNxpXUZCTjysT6hMmSc
	B9FgcQL8vyAG3U23pxFetkNrrXEHdDDnI13xV7oTYMvnf9bPdSz6LHWQaoguXlgoKhMJ
	2D5MtVLuAkWlK7tmhhrxSOzfNtJyF0l4rAE/UXHqWUEF9dCtBN3Hdz57luoKo0XvYzmo
	k4yeETcM7vvrVB7k80R+H1NvnyqGq/dG2VyufWxu+VNioJsuFd8TTHvPqpqDnyWmBHbe
	h3Eg==
X-Gm-Message-State: AOUpUlH+KuRwKRVtkAPURpLCGNaDPFPfxm1Ia4dvSL7ym0QEJA9I3aqz
	29z65/6hdRT3zqJBCr7tR6wWlfMJpnR0WvETp3qzaA==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr16257862oia.11.1532959679569; 
	Mon, 30 Jul 2018 07:07:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 07:07:39
	-0700 (PDT)
In-Reply-To: <20180727132311.2777-1-f4bug@amsat.org>
References: <20180727132311.2777-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 15:07:39 +0100
Message-ID: <CAFEAcA8eyggMm5QH_VyJYHO2orQUgS1vRdRV9s4qrit+QvpiJg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH] target/arm: Remove duplicate 'host' entry in
 '-cpu ?' output
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2akd1zDo/wj1

On 27 July 2018 at 14:23, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Since 86f0a186d6f the TYPE_ARM_HOST_CPU is only compiled when CONFIG_KVM
> is enabled.
>
> Remove the now redundant special-case introduced in a96c0514ab7, to avoid=
:
>
>   $ qemu-system-aarch64 -machine virt -cpu \? | fgrep host
>   host
>   host (only available in KVM mode)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/arm/helper.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 22d812240a..66afb08ee0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5591,12 +5591,6 @@ void arm_cpu_list(FILE *f, fprintf_function cpu_fp=
rintf)
>      (*cpu_fprintf)(f, "Available CPUs:\n");
>      g_slist_foreach(list, arm_cpu_list_entry, &s);
>      g_slist_free(list);
> -#ifdef CONFIG_KVM
> -    /* The 'host' CPU type is dynamically registered only if KVM is
> -     * enabled, so we have to special-case it here:
> -     */
> -    (*cpu_fprintf)(f, "  host (only available in KVM mode)\n");
> -#endif
>  }

Applied to target-arm.next for 3.0, thanks.

-- PMM
