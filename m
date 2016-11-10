Received: by 10.25.150.194 with SMTP id y185csp927858lfd;
        Thu, 10 Nov 2016 09:54:49 -0800 (PST)
X-Received: by 10.28.227.9 with SMTP id a9mr6957659wmh.85.1478800489078;
        Thu, 10 Nov 2016 09:54:49 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com. [2a00:1450:400c:c09::241])
        by mx.google.com with ESMTPS id 76si7128263wmj.42.2016.11.10.09.54.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:54:49 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) client-ip=2a00:1450:400c:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x241.google.com with SMTP id g23so4629317wme.1;
        Thu, 10 Nov 2016 09:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=f0EfKgLTyVRGl+5Wsken3qMs+4FrudoAJffLzS3pTAQ=;
        b=TgTtY9O9W7qrE1i7npP9qh/3F5w/PhWyVolCXBTis8mZFF/k1roc2ht3ZTsn2ZMs35
         TovLffIa1/DlKIcQL/DVKFgWJ37HLi8HDLIKEEJZmXMVh96hP4/k6zQ++necVHgLaw9O
         2Kcuvm6UhWULZLFRSBGxGB66rvXSP5ptnBg+C43nFiWBZ/6M9k/vcOz/OmS4PWqCtd4y
         9j4JtkfWMe/KKY02tTOKfF5rft7+PtCbzmGQcnqIQzJsI7sAlqzMmVuiapWXAMhVpWB6
         i+vS3EzDtBjfJeRm914y+Itum/NWqRn5bo9d/R87zeVjchtw45dauXuCj0vKu5sLkGwD
         C0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=f0EfKgLTyVRGl+5Wsken3qMs+4FrudoAJffLzS3pTAQ=;
        b=IQN97D5nfLNuPk9/ooWS58NEKGgR5ct64pdydpCLievMf/j0Aogt4hxznyFOkcRKUX
         xkFOUmt4e5t3PRpBSlEVL6s/Eg4htHGoOz+JZn2KO6Iq9xswL8KvuIekfAmcJX9tR1vf
         3vYwCOK0mz7ST2QCfJ+ArxOt1zoCKHj3ntCE4WuSpX9NRsmkQscft3+KhsQZzsquzjc8
         MvOV/LJUar0J8N3Wow46lyUC/urxNMvwpXiXDL7cKxsBHsWjh70Kt/bSyyjE2jD5xIUv
         HzFDg6J+Ou5VpQNAsEBplAJ5pP27IwAUiULhUmu/YKnnPcN2YUriILwqGFIhtipJZXdL
         5WOQ==
X-Gm-Message-State: ABUngvfEZqt2v/RFluTRqDR0IONd5rVUdAVV4U/lhsEWymm1n2wiJfuYNgI1BHYPPjCbIg==
X-Received: by 10.194.47.42 with SMTP id a10mr5523657wjn.216.1478800488729;
        Thu, 10 Nov 2016 09:54:48 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([87.111.149.139])
        by smtp.googlemail.com with ESMTPSA id q125sm7458870wmd.2.2016.11.10.09.54.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:54:48 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v6 16/19] target-arm: ensure BQL taken for ARM_CP_IO
 register access
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, pbonzini@redhat.com
References: <20161109145748.27282-1-alex.bennee@linaro.org>
 <20161109145748.27282-17-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, mttcg@greensocs.com, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com,
 jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org,
 claudio.fontana@huawei.com, "open list:ARM cores" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <0cdd6634-cc16-91ae-41b3-061e4ae0e81d@twiddle.net>
Date: Thu, 10 Nov 2016 18:54:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161109145748.27282-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8wwLuw/J+Hvs

On 11/09/2016 03:57 PM, Alex Bennée wrote:
> Most ARMCPRegInfo structures just allow updating of the CPU field.
> However some have more complex operations that *may* be have cross vCPU
> effects therefor need to be serialised. The most obvious examples at the
> moment are things that affect the GICv3 IRQ controller. To avoid
> applying this requirement to all registers with custom access functions
> we check for if the type is marked ARM_CP_IO.
>
> By default all MMIO access to devices already takes the BQL to serialise
> hardware emulation.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c |  3 +++
>  target-arm/op_helper.c    | 39 +++++++++++++++++++++++++++++++++++----
>  2 files changed, 38 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
