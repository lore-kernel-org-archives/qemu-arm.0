Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp13853747lff;
        Sat, 28 Dec 2019 18:58:23 -0800 (PST)
X-Received: by 2002:a17:902:6501:: with SMTP id b1mr50021467plk.121.1577588303475;
        Sat, 28 Dec 2019 18:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577588303; cv=none;
        d=google.com; s=arc-20160816;
        b=FDaeiaU2UiVVDIFIZdd5kn/Y5KhsV+zJN0+nMyWfrUE2FzcnpIhLFSfvCRDE4mvwL4
         d6QVBFvMNO/dLMxlp7VKwjCFBAEQ/BRNxd+O/Zycfc5FxwxRUOnw9E03LecoepdZC5Xs
         kUNfet7fcE6Z4jCGfxfzCljFtUlfuOvpRh746LxxEL/BMl03czyWw0rC/M8uCsQW6R9k
         CWaFLzRtBRasbRkCclRm2tSIbYPHwx1P0SkWYJYIOWj0T43pIIlAQa0WFeHfNeCbtQ9h
         Fis+AXe6YY6HVvx0zeyBniIRoB6i2ZXMyJHcUiA2iL8HbsVfA/sJ5g6M8QsXiX50TPVN
         J/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=sKTtw6iLCBEzEWlSLDwQfYCTUbvbbN6mdX1NAs6ay7c=;
        b=WtL4sWzFIsHeI6QeKk88CDuWN15/M/ksQ9zRBV4yfXNbCDOJMs/LmgEyz31f5aZguS
         Vq9a7xdgQ1eIIk1bB/RNIeuMS5k31ATUWYdAR0PI8TdgTXE7o3Hg3yNhvAQayrhQ0GZm
         wf80x6GzyZE/KZlhXeg2dAY5eLvMqscGLlthaJ4a7xwBhToaATwy/C1IwzLTzREQCLnQ
         uaMLQCVN1289dx14QHCjEQ25jQa3r/Go0/x3BFsh5hxbOek73mgsqrHjJxhzImg4hokw
         c67nTWuuZbdoq/4roQs8Q5EEqHfgx+22xjPHpagY+T7MykMhuZ3nN9Mp3znSig2z35nq
         Dn+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H70OHFsr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u4sor19768689pjy.14.2019.12.28.18.58.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Dec 2019 18:58:23 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H70OHFsr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sKTtw6iLCBEzEWlSLDwQfYCTUbvbbN6mdX1NAs6ay7c=;
        b=H70OHFsrftMWCZ+UDyLDurr+aPNwErsai9BBFaX7OZuBVJHeCw+YhsseNa5qig4qul
         My0e593G5MjbbDkLwwQloDRfWc+3JiehgSohGtCNBR2nWZnWxWEaUvecQko5aMs3Yexv
         z2e2Vt4EdGebmCa0BH6ctK9zDDOjbatoG4DD2BLPjhRwauYxM1kr248IeiYMKIyQbObN
         9X4/tP2/XwqCX/a5Ymz65w8CnV4FSGPEXN90wnIsVmf+Bk5b8p/nfazfoMp3Jy41KuwL
         HF2N0pfvX3C0rwWaMZ+/3+37gmORQ1FmcUJRat1GvYV7t+YFh60Yvwdt1aGGTCTj+B43
         MO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sKTtw6iLCBEzEWlSLDwQfYCTUbvbbN6mdX1NAs6ay7c=;
        b=eRu7BlkgjQw3/2L3mnOFJYF5XVLhAvfexVU5HRXMU6i/xW1G8OssSJrt68I7G8xK8Z
         /ro7eVdlAOO9TbixuDhPAXCnDfUlD1vTphJhr5CKQdaLi1LSfYgqcnNwXghZe+Hcub2j
         gq0n+pQGowIZjKtPak3fbCuW0yHxkqm2aipj8KmIYbRsUDaymdLq3RLwB96Bxs1Hokl1
         j/CeIk5uw/icadqn8HYofQm5UXids8I2C3mJdPVSyir3+n4gXf7v1XNMLj+BBK7xcqxl
         SxqvCgm7kEx6xiR9NhGCF5PwKKOMG32yWCWZmOCadsZd2U9ZXgDuQBOqop72RvvNmhPb
         cO4g==
X-Gm-Message-State: APjAAAXTM7t1WqqzSgCm7RPi7gZm4Ej+n+EA/5OZL/mLlkG0Xedx0qWt
	NuA6XixVyStik+veawJKSqY10JmI
X-Google-Smtp-Source: APXvYqwZX7YM1CM5Aw6RCoQfQjKAHAnIC3xDHjYOmV0bqMLkst+9ANruVM+de+7AdO65vBs5ufcyyg==
X-Received: by 2002:a17:90a:aa84:: with SMTP id l4mr36952343pjq.143.1577588303071;
        Sat, 28 Dec 2019 18:58:23 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.118] (194-223-58-9.tpgi.com.au. [194.223.58.9])
        by smtp.gmail.com with ESMTPSA id x11sm44613813pfn.53.2019.12.28.18.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2019 18:58:22 -0800 (PST)
Subject: Re: [PATCH v2 3/5] semihosting: add qemu_semihosting_console_inc for
 SYS_READC
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, keithp@keithp.com,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20191220132246.6759-1-alex.bennee@linaro.org>
 <20191220132246.6759-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2332616-1bef-fd80-817a-0c9c75f89162@linaro.org>
Date: Sun, 29 Dec 2019 13:58:15 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191220132246.6759-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6jJLecUBC5H9

On 12/21/19 12:22 AM, Alex Bennée wrote:
> From: Keith Packard <keithp@keithp.com>
> 
> Provides a blocking call to read a character from the console using
> semihosting.chardev, if specified. This takes some careful command
> line options to use stdio successfully as the serial ports, monitor
> and semihost all want to use stdio. Here's a sample set of command
> line options which share stdio between semihost, monitor and serial
> ports:
> 
> 	qemu \
> 	-chardev stdio,mux=on,id=stdio0 \
> 	-serial chardev:stdio0 \
> 	-semihosting-config enable=on,chardev=stdio0 \
> 	-mon chardev=stdio0,mode=readline
> 
> This creates a chardev hooked to stdio and then connects all of the
> subsystems to it. A shorter mechanism would be good to hear about.
> 
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Message-Id: <20191104204230.12249-1-keithp@keithp.com>
> [AJB: fixed up deadlock, minor commit title reword]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Keith Packard <keithp@keithp.com>
> Tested-by: Keith Packard <keithp@keithp.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
