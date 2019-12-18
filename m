Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1281431lff;
        Wed, 18 Dec 2019 12:16:37 -0800 (PST)
X-Received: by 2002:a63:444b:: with SMTP id t11mr4927437pgk.72.1576700197237;
        Wed, 18 Dec 2019 12:16:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576700197; cv=none;
        d=google.com; s=arc-20160816;
        b=qDFxOWIQrKaREJdkMyMkMPLXTsDk+RyTmwS0mZgDtpcG5dLmVsAKVnDYcz0V8x9A2H
         mkltaxkZ5tXZ2/eoq5WnzLOzYPJynBMjE5yk3HfxdcQApKLAdfUg8D4Ep8G3DZa1Wg3p
         LT1nde8aeFHrCRn1Q4065SDP+vU+laQhYTj05TLh9mHaZcWXCeakYV0EGTfuLWhnd+oq
         u4Hu5untLbGr0HTTcq4OXivCNONePYrWvqJDWmKU5sfBdsfu2uO8mcJQRRDuHOVBN9US
         Aqep+VG13fRebGPCqWEMGwuy02Gl3L62oQZKqDL57qDfZNMMIWtZLSCWHnFd6aSTCgYL
         pn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=imihML2X4ulF6Cvoo2a0C+FhAV8/c9KGoJ7dSo18MqQ=;
        b=xNxnkIalJ7vQIy44q1ZizuJ1WrbsllMlMYRNiOqaAxBF3iedggfch1fGWY2PZH/pCE
         rh24K69ti4ItX9p6uymrdEU+HA7TPVDoDICOwRdwgt7F5VuxWacsu21gW7CxO0dWk16i
         6mXMZnyYJtSGD3VzqhCdGfRzppu8v7HwQEoAoY4IJFetmEhAPSd2p5skaAFUevX5tyO1
         8Vm1RxW8A9ABYQH7VrIoU/wVKVBQSAqGq2XGVJHsCPANm4oKB+YcWyVB/rhEGfDk8VGC
         yhRIRWOFH17hS5Q0IdgyYueXjEwMgkAK7Et3pKRgoOsX1AD4BZfR20WqIZBebxHN/y1o
         koBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QnVhgSE7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v3sor3763190pgk.54.2019.12.18.12.16.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Dec 2019 12:16:37 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QnVhgSE7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=imihML2X4ulF6Cvoo2a0C+FhAV8/c9KGoJ7dSo18MqQ=;
        b=QnVhgSE7o8gY7kFKUbFXaMfubO9N6B4UpDRV62EYoPHZQ1k7uTXv/rL/7A8oxpO/0X
         Pgz7B8RmwYJYoPAOeKNqQ+KWSgcFDl7aIiVzIsic7eiuX6wu2F/pWDpGB4Yboh6xoI0f
         0FK1jeocLUz6wf1m325ZlrwT6HVDkBOoKS869e1TBs0CvvIQL+pCGjrVVkuA5eVOCoRO
         S7amjx3MsRCPKr0wlOqSCrwSv6GqZ5whQAPLr8FSqGJT7mzjQX45sWNu793m2imdJ+rY
         jPGvaGnt+ydCXAU2iTROxqSgmZcCxxP9zTXdd4i++fVxKLls1HMgVvH3h6jCbfnsgRbw
         LnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=imihML2X4ulF6Cvoo2a0C+FhAV8/c9KGoJ7dSo18MqQ=;
        b=s8Vy7g7klK9hnQwKfrSVGbsNiB8RsROPkmF7hfdgpJqjGcqVUlf2yAGKU5/qBrn+mO
         et5qXGsAc24Uhf+YkcaWFxLbOAmJjnvKOGXb7hzR0QATjt6zaV/FSUgIEyPt29Egm9rs
         fogdxLUctXrYSs162YheMIaiSUNiEXISDbFKZrexqtOec/A70ClcJM0GL5ay1+bizw5a
         Fe6KZrs+Bmr3Nm7ClQyJXxkLl9NuxCFsPe6qw6iGJUqQUeq1DPiSo1RDO935PvAyNeM8
         jeijDpb6AtYyz14lFuGewpv7WoYqBh2RtJ3RdNQbRIZvYzuJtK+rIapFgfAnHvFkcAtX
         EZ9g==
X-Gm-Message-State: APjAAAVPibNypecJl2dlv53H6gVoXAZa4ZJ5KuXw3N3xGsXBsTWxsZZC
	VdHUR8xRRfF75KDZGn38bUgi0FR8
X-Google-Smtp-Source: APXvYqylzub/2RqlAjktCcgUMR3g4Y4wdSZGw5SRfrpOCegeJSWqeIZIKcT2CezO8xXBg7KyWxgIfw==
X-Received: by 2002:a65:66da:: with SMTP id c26mr5057095pgw.354.1576700196642;
        Wed, 18 Dec 2019 12:16:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445? ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
        by smtp.gmail.com with ESMTPSA id r3sm4434114pfg.145.2019.12.18.12.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 12:16:35 -0800 (PST)
Subject: Re: [PATCH v1 3/4] semihosting: add qemu_semihosting_console_inc for
 SYS_READC
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, keithp@keithp.com,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, pbonzini@redhat.com
References: <20191218180029.6744-1-alex.bennee@linaro.org>
 <20191218180029.6744-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ca1462e-5129-2b32-f014-a732a26a0587@linaro.org>
Date: Wed, 18 Dec 2019 10:16:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218180029.6744-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: OpqB5LghoWs+

On 12/18/19 8:00 AM, Alex Bennée wrote:
> From: Keith Packard <keithp@keithp.com>
> 
> Provides a blocking call to read a character from the console using
> semihosting.chardev, if specified. This takes some careful command
> line options to use stdio successfully as the serial ports, monitor
> and semihost all want to use stdio. Here's a sample set of command
> line options which share stdio betwen semihost, monitor and serial

between.

> +/**
> + * qemu_semihosting_console_inc:
> + * @env: CPUArchState
> + *
> + * Receive single character from debug console. This may be the remote
> + * gdb session if a softmmu guest is currently being debugged. As this
> + * call may block if no data is available we suspend the CPU and will
> + * rexecute the instruction when data is there. Therefor two

re-execute, Therefore

> + * conditions must be met:
> + *   - CPUState is syncronised before callinging this function

synchronized, calling

> + *   - pc is only updated once the character is succesfully returned

successfully.


> +static int console_can_read(void *opaque)
> +{
> +    SemihostingConsole *c = opaque;
> +    int ret;
> +    g_assert(qemu_mutex_iothread_locked());
> +    ret = (int) fifo8_num_free(&c->fifo);
> +    return ret;
> +}

Boolean result; better as

  return fifo8_num_free(&c->fifo) > 0

(We could usefully change IOCanReadHandler to return bool to emphasize this.)

> +static void console_wake_up(gpointer data, gpointer user_data)
> +{
> +    CPUState *cs = (CPUState *) data;
> +    /* cpu_handle_halt won't know we have work so just unbung here */
> +    cs->halted = 0;
> +    qemu_cpu_kick(cs);
> +}
> +
> +static void console_read(void *opaque, const uint8_t *buf, int size)
> +{
> +    SemihostingConsole *c = opaque;
> +    g_assert(qemu_mutex_iothread_locked());
> +    while (size-- && !fifo8_is_full(&c->fifo)) {
> +        fifo8_push(&c->fifo, *buf++);
> +    }
> +    g_slist_foreach(c->sleeping_cpus, console_wake_up, NULL);
> +}

I think you should be clearing sleeping_cpus here, after they've all been kicked.

> +target_ulong qemu_semihosting_console_inc(CPUArchState *env)
> +{
> +    uint8_t ch;
> +    SemihostingConsole *c = &console;
> +    g_assert(qemu_mutex_iothread_locked());
> +    g_assert(current_cpu);
> +    if (fifo8_is_empty(&c->fifo)) {
> +        c->sleeping_cpus = g_slist_prepend(c->sleeping_cpus, current_cpu);
> +        current_cpu->halted = 1;
> +        current_cpu->exception_index = EXCP_HALTED;
> +        cpu_loop_exit(current_cpu);
> +        /* never returns */
> +    }
> +    c->sleeping_cpus = g_slist_remove_all(c->sleeping_cpus, current_cpu);

Which would mean you would not have to do this, because current_cpu is only on
the list when it is halted.

I presume all semihosting holds the BQL before we reach here, and we are not
racing on this datastructure?

> +target_ulong qemu_semihosting_console_inc(CPUArchState *env)
> +{
> +    uint8_t c;
> +    struct pollfd pollfd = {
> +        .fd = STDIN_FILENO,
> +        .events = POLLIN
> +    };
> +
> +    if (poll(&pollfd, 1, -1) != 1) {
> +        qemu_log_mask(LOG_UNIMP, "%s: unexpected read from stdin failure",
> +                      __func__);
> +        return (target_ulong) -1;
> +    }

Why are you polling stdin?  linux-user isn't system mode, there isn't a
separate monitor thread to get blocked, and you aren't even blocking the thread
to try again just returning -1 to the guest.


r~
