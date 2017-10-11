Received: by 10.223.197.9 with SMTP id q9csp693912wrf;
        Wed, 11 Oct 2017 07:56:15 -0700 (PDT)
X-Received: by 10.200.33.235 with SMTP id 40mr24627493qtz.185.1507733775423;
        Wed, 11 Oct 2017 07:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507733775; cv=none;
        d=google.com; s=arc-20160816;
        b=jElSlNBMYzyU56rKhLTn4IbR+fUrQzfAKo5KNF3ZKWSdkEMOxgbyv0D/ImwYhf3ot+
         t7gRnDMfxkvOhGDvcxYFEaxgnhnoZASBzsSwbLYIFZFILIAd3Rfpi907wLR8vbX8Y8qZ
         9/uw5Lm0xeDJWy+ihXo6WGoSGsaT+mvtwWtUuxYOh4uzz44sY7qdgJfyI8icuIGFIMKY
         AKG1vZ+s++9vUuzTuDxcXEJKVyTsU8ouvX66WX/xOcaiHVTY5+NyTwT0ZQ1Up0voYtqL
         kwE/aqCabjGtHr1A4UMm9DeeCiVH/S1EQNLenq06Rkjgx7sS+39uRbdmxNOA0CI5vdCV
         YzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RByV7/C3f3k/ehgr9r5FmCv0x4MmGZCCY9XHgbQE04E=;
        b=ZhJzCzi86r9g97EgOcvcOifoR9QHv1ekqXvFU8ZxlGZXFgPe0iebwHx1XkhS+4x4sR
         YTvNuBbj9RkGcCmnyvfq5Uycz6HczLfToUde/kuVl4eGSe4cEsWII2ucRvMYBvI3vevf
         FbABu7AsAj09NkuVusXlXKKDh2cwE1Aqe50ulOXzN1HeZXYn0SPD1FA7P3IW6ferBnmw
         VUX8xiCRlHdpykZrbJOPqhg8gIzfPERBF7Q2WsnVGkOi6jgjN5QgubpWtcnFZDe/Fdph
         cy0WbuyGEOBiAR7Ug9SA0zfBGmC6U/yVb1GyTOrCHw8lNwkWmaTgAXQ18a5z6aTidMjs
         J1GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MiSsFB+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h18si1389760qtb.281.2017.10.11.07.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 07:56:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MiSsFB+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2IQf-0002M9-44
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 10:56:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2IQY-0002Lm-Hf
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 10:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2IQX-00079v-Fd
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 10:56:06 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:52134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e2IQX-00079L-9F
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 10:56:05 -0400
Received: by mail-wm0-x22d.google.com with SMTP id f4so5644177wme.0
	for <qemu-arm@nongnu.org>; Wed, 11 Oct 2017 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RByV7/C3f3k/ehgr9r5FmCv0x4MmGZCCY9XHgbQE04E=;
	b=MiSsFB+DoTG70pbgum3WmJYkCSBLwlGgwq3+4d5F6XegaGROc9wYDSBXz6ffb9qHo3
	+dwpyvy1ReeOTQDy5Dmq0L/YqwSKfetVPkbJAWT9uuM4tJb2RfV8SlPsdxnf5W2b8MtS
	ltadYLkZ530mckhI6warSDHGs0yfhBx5IpZP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RByV7/C3f3k/ehgr9r5FmCv0x4MmGZCCY9XHgbQE04E=;
	b=oNWT0A9Hn2xGyypcBiKt7df93MYUFqVT50SUWhrzevCrKMEq9tIYW1qqBgrTMpZaAO
	MqLhlZgHh6F9eBjOAk2j30HFzmYvEN+zx2AclCzRWT1pGvUOS5spnitnIlJ9QS6FlRVS
	zLBU9iNGQ36NPoqf/MCs0FZC0oDbJNXBK0Yb+QREky/5JMSwZSgoKIo6tPoPO5ij5CuF
	rtguHX3ctaW/QGi+42vOK04nsx8QT2B5xFJ1mH0y91rigfDzOaz7ZKi5Idw533UW4ifu
	c6XHS4nhABy/6BDcNxhtLi+C9XBcZ6slXnPm7c1QKxk/Tt7vbHv/ti/CkU11/FnFD3ev
	cOJQ==
X-Gm-Message-State: AMCzsaXc6qrFYfU4OSoERc0sJ92xfFijPxJF4ntsng0SmdyYJHIXNcYX
	LajEdm3b568HGKpuRAM0dsUfIemsZeeBNcbYv+03ZA==
X-Google-Smtp-Source: AOwi7QDXYZiHVrgOjddRfnCJPTxODZI794OsyueBkJyX8nzzLzMeVcesjBqL5S9AjnrVWsn3RJyJyQJHAwmRl2nsmlQ=
X-Received: by 10.28.236.203 with SMTP id h72mr15475827wmi.147.1507733764157; 
	Wed, 11 Oct 2017 07:56:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Wed, 11 Oct 2017 07:55:43 -0700 (PDT)
In-Reply-To: <1507710805-221721-1-git-send-email-imammedo@redhat.com>
References: <1507710805-221721-1-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Oct 2017 15:55:43 +0100
Message-ID: <CAFEAcA9gO1XZOsmKXi0fLwKUDorTgvLgkHZuMtZPyhzhBzC98w@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [PATCH] arm: fix armv7m_init() declaration to match
 definition
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
X-TUID: TcJoikBUXy7t

On 11 October 2017 at 09:33, Igor Mammedov <imammedo@redhat.com> wrote:
> s/cpu_model/cpu_type/ that has been forgotten during
> conversion (ba1ba5cc), while touching the line also
> fixup alignment.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/arm/arm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index a3f79d3..ce769bd 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -25,7 +25,7 @@ typedef enum {
>
>  /* armv7m.c */
>  DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
> -                      const char *kernel_filename, const char *cpu_model);
> +                         const char *kernel_filename, const char *cpu_type);
>  /**
>   * armv7m_load_kernel:
>   * @cpu: CPU
> --
> 2.7.4



Applied to target-arm.next, thanks.

-- PMM
