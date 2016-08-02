Received: by 10.25.21.156 with SMTP id 28csp127209lfv;
        Tue, 2 Aug 2016 04:11:28 -0700 (PDT)
X-Received: by 10.37.13.66 with SMTP id 63mr27107234ybn.127.1470136285036;
        Tue, 02 Aug 2016 04:11:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o76si1259709qkl.195.2016.08.02.04.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 04:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUXbY-0002zs-CX
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 07:11:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUXbS-0002zQ-6b
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 07:11:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUXbN-0006hx-Cn
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 07:11:17 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35256)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUXbM-0006ho-JA
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 07:11:13 -0400
Received: by mail-vk0-x233.google.com with SMTP id w127so119929008vkh.2
	for <qemu-arm@nongnu.org>; Tue, 02 Aug 2016 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=05JteRSzhkzAn9BLDALm76QsupLug2DkhlREToKu2tU=;
	b=P2ukx9NuSrMWTQ+abjyye2l72mDEr6W5FiPo+9+pWRW4Oy7tS5XyArI2Ks5+HwN3bP
	56xSoE36H35zJh/o+a1FSf3iKdq44cPRXYwhXYQmYvmy+Ue+XavJSEPa3TUiz/KexLdi
	fj+ALSjLJXoYpMmWAy7+IcAx+fNRX5+9aaFr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=05JteRSzhkzAn9BLDALm76QsupLug2DkhlREToKu2tU=;
	b=JyxsaLn7jtOQ5zYxS65Tj81+zH6WNk93awnNMk2iLfAc5uJuwB5liPWVfCBcdWV2Zv
	yoZsd5LzV7mh66xJAha0MgXKgaVO3V5Thtv0vwyaqbwQuxL7zY/spkhFkdJzuwTT4Qu5
	M12Kjo4UZvwh+CSJDDqltvsVumNYdRhRdaiKk7/jtMFnu8ZV4+Sf9s00Rn/BnngCDMPd
	C3uX207LHJlR9js6GCiAA0RY5HCr7+KlY6nPU6iZtyiEAGiV8b2YB4IRhgsBGMq8eZQA
	7xc/OpFEekMuPOd8S6kb370x+Oxt/VXLvOhTUEqvprSGIs+NiZgIKkYfY0PKLf7yVzXT
	wHnQ==
X-Gm-Message-State: AEkooutFUxCsyb/GSITue50RYdyTUmgYJv4MNNzk9ZmEpxWCm0boIB55gA2YxscsUJY7ZOX3jIawftHEo6z1voAl
X-Received: by 10.31.84.69 with SMTP id i66mr12862541vkb.82.1470136272068;
	Tue, 02 Aug 2016 04:11:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.200 with HTTP; Tue, 2 Aug 2016 04:10:51 -0700 (PDT)
In-Reply-To: <1470133216-6758-2-git-send-email-vijay.kilari@gmail.com>
References: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
	<1470133216-6758-2-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Aug 2016 12:10:51 +0100
Message-ID: <CAFEAcA_VrHHWaD0jPAJzw-x0NAym81yxQBQFD4WtK6mR6y035Q@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-arm] [RFC PATCH v1 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"prasun.kapoor" <Prasun.Kapoor@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qhactR1DqiNg

On 2 August 2016 at 11:20,  <vijay.kilari@gmail.com> wrote:
> +long int qemu_read_cpuid_info(void)

Don't use "long" here, it might be 32 or 64 bits.
The kernel ABI for the /sys/ file we're reading says it
is a 64-bit value, so uint64_t is what you want.

> +{
> +    FILE *fp;
> +    char *buf;
> +    long int midr = 0;
> +#define BUF_SIZE 32
> +
> +    fp = fopen("/sys/devices/system/cpu/cpu0/regs/identification/midr_el1",
> +               "r");
> +    if (!fp) {
> +        return 0;
> +    }
> +
> +    buf = g_malloc0(BUF_SIZE);
> +    if (!buf) {
> +        fclose(fp);
> +        return 0;
> +    }
> +
> +    if (buf != fgets(buf, BUF_SIZE - 1, fp)) {
> +        goto out;
> +    }

g_file_get_contents() is probably easier than manually
opening the file and reading it into an allocated buffer.

> +
> +    if (qemu_strtol(buf, NULL, 0, &midr) < 0) {

qemu_strtoull().

> +        goto out;
> +    }
> +
> +out:
> +    g_free(buf);
> +    fclose(fp);
> +
> +    return midr;
> +}
> +#endif
> --
> 1.7.9.5
>

thanks
-- PMM
