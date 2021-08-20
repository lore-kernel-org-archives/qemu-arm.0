Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1540319lfg;
        Fri, 20 Aug 2021 11:19:41 -0700 (PDT)
X-Received: by 2002:adf:dc0b:: with SMTP id t11mr102306wri.259.1629483581880;
        Fri, 20 Aug 2021 11:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629483581; cv=none;
        d=google.com; s=arc-20160816;
        b=UuXI6Berr45ciE/iuFyGi5Jppt+hgIdrmFrJVAxAoDMZUUxn8VipCzLiqU4UBUXoPO
         KX+RM4GhSmrTqntzZvRkeM5IcIzNOle8EigUnDNeJQlt+SPy9lzzk7o+XbVBhC0y3Tte
         vAxpTz97K8sqMNC51jrI9Upyde0Ff5/HiuFOsXfu9l38Ct95tafPUvPtcnJkBpxLVgBQ
         1CW/dR+DhT4LbAKoDwfga6UKPpejE5gspXQKrrS+K8rawfzkzis8r3ufdgN/hXXWdhyE
         KDABjpFieGwPrDcOhc3kNUUKIsSDkAClm5WfziK5gl8CgJH6AvMMwdmH2ql3KGnCKlEo
         az7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=6GTf8G00k/lbx16Y+ydCPShh4krPLmrh308MK2m0qQo=;
        b=HqmPY4Z8aW+W5QukjAThOWrwLjg6gexVTQHzvv/XZDcDG16MbEadkLF9O01spsdyud
         qU3Boo0aOp5FKbKv4XXbAaQgqKhZKkNmAaua4afDm+0xmW/rQFKN1DBStkNbDIqzGz0D
         SL2gHMXvvlph0e+PSMrfF4hQMrPhpuN17JOe4gguBTNM/jZjNuE16rj+LeiED04gipDY
         3A40IROTO5t3JTnvFKGZqeuS0pCb/ycA0HFksbpASqBFVRutrsH+ikVE1zuzZHW/8Ww/
         XUPXQtCEtUUCMbWzzUEEGOXxLoOfFmDQB+OR4397+X+T8SNam9KwLe7pTKpLzsQ6Qe59
         4r2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WlBuAjNI;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x3sor6289440wmj.29.2021.08.20.11.19.41
        (Google Transport Security);
        Fri, 20 Aug 2021 11:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WlBuAjNI;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6GTf8G00k/lbx16Y+ydCPShh4krPLmrh308MK2m0qQo=;
        b=WlBuAjNIVPeY9y8GxcstkjFuj5UfQtM6qxvOdnGJwXTIzrTqifdxrwBz9xeOgZ7tZT
         HNwuFeSYGpbTZIKs06ALDDTiC5WIr00Zmr9/dZ/Z0VCOGgDcxAJiJ16kKGw5x9F+mvMG
         yvlwGznFdId45YRvZbrRikgGWLfGlKPkR8JZxXy3i48ByqhGey7tWbChsYzIXO770ANZ
         yLC/2jANQsjAMLcpC6p7lmIUyhSa29ofTIrO7c4QiBo6lePZcOzuxjU2iR80E7nOnjpO
         YtgOKA+PESpcFzUJY2Y+uVx/w2BUSS9NMIS/LR85Rv6e3QfTEpzWOyqDGR989Ls5JYEf
         4QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6GTf8G00k/lbx16Y+ydCPShh4krPLmrh308MK2m0qQo=;
        b=ozlYCtkDE5odZXVesviGqZHqxjkpJavraVEWpbrWErlGxEu1S4BId4a+nd0h4uMDJI
         dD1RibjKSgn7YElkZ9aUlGhOdAIi0b0bf1CoAMqlJ32vgE+XrcIvbNSlklsCP+cYaFe1
         +jTHrQTnnPltsABwXWyKYQqUDBkV382+MZWIpfW0j5Y+9/L319C9jBJyLQI+A4exr6Fs
         oQ7X2715rmww3v7zBXRakwB2sc5nCpnEui4+w3dh4ciEAhIA3vzuaMYFXnDlBxaYQZzB
         4rXouTGZbqKmrjeA9jX8G1wzJbPLnsd1RbqjhWcEhjpCXI5r4LncCLZ4iJJ0tKlbSQ+w
         NRVw==
X-Gm-Message-State: AOAM533A8s4112pWUAPacoqoeGFO3ZYft0MqgS/rR6txUxVzyoYlJlav
	BpU+C6AqhBGoKInGcqZFwmc=
X-Google-Smtp-Source: ABdhPJx6nujNbAsFA324mFQGKfQnwFDExMQwWY9lcX1rvvqrMIzPeIl7BJfzMc3LCZ4Hgu8A4zjtog==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr5149358wmz.93.1629483581566;
        Fri, 20 Aug 2021 11:19:41 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id f17sm6753296wrt.49.2021.08.20.11.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 11:19:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v4 0/1] hw/pflash_cfi01: Allow an administrator to reduce
 the memory consumption of flash devices
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?= <haibinzhang@tencent.com>,
 John Snow <jsnow@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xu Yandong <xuyandong2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Zheng Xiang <zhengxiang9@huawei.com>
References: <20210810134050.396747-1-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0a3bdfa0-5361-5be4-fbd9-d1573b2864ab@amsat.org>
Date: Fri, 20 Aug 2021 20:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810134050.396747-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: hJTejd8dE9wY

Hi David,

On 8/10/21 3:40 PM, David Edmondson wrote:
> As described in
> https://lore.kernel.org/r/20201116104216.439650-1-david.edmondson@oracle.com
> and
> https://lore.kernel.org/r/20210222174757.2329740-1-david.edmondson@oracle.com
> I'd like to reduce the amount of memory consumed by QEMU mapping UEFI
> images on aarch64.

> v4:
> - Rebase.

Sorry I haven't forgotten about your patch, I can't make room
to think quietly about your problem. I reserved a dedicated
slot of few hours next week.
