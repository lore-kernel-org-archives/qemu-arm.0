Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2344381ejb;
        Mon, 20 Nov 2023 09:20:15 -0800 (PST)
X-Received: by 2002:a05:600c:3c9b:b0:40a:3e41:7dd8 with SMTP id bg27-20020a05600c3c9b00b0040a3e417dd8mr5965942wmb.13.1700500814821;
        Mon, 20 Nov 2023 09:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700500814; cv=none;
        d=google.com; s=arc-20160816;
        b=s26q8Q5kU0feRPxl4Pl5n9u+rDQ0t1OciT4U9uIp5kP+Y136ii9z5zoZbeeM0u2XDu
         CuA2MJPzvcz5pTf+gudKhjmMGzZnl0AThbWefLCH7Wb3rmezMEX0z8Tkr/xW3EMaNDo+
         H1z2d3iQdOFyBRo4SiIfw49i9uEPLJ8CgKShKQGikcm2rHCQV7hYVoCCddKttjToxqRX
         9DnA4UFhTnrCCW+goncsWfv9497mixLJIHewyzJJJu7P0pCKkZQ34KdmbsiFuwGJQ+0e
         Gp1rdSn6YpbqFxKCsywXlkgGeRcQvJUfNlB1MORLueph7x2A57xP5YBL3N3ur7ELdngo
         NPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mVIv7aU6HgSc0oGDYnX/XF6kJGW1ilVSANr7wEYc3ok=;
        fh=3TzG9tw3D4VaZV16bpIeCZ9/1QLMzMiBvCqAmyCwfsk=;
        b=eMD02Wr3CmKDm37/iev1nYt62UEXgTxLt8ybulxGqxkhmy6WFjYMQCY4OhVu+YEsFx
         Oc/m9tLw1c0TEe6dS/HOqOmqm4IyzY8pt3HNQ0eJ548KFhtyXPrVSQTUJVZt0vKkdDBE
         Kcj8T+rGyDHcFO++ypmKMuP+nPlQoXHyGXSSqbuG32TX/qg5rovhtDwFpZUEftFHm5Mt
         QmW9p9z6GRS1eYFm8RdWJrO4Lz057zF3LcIqXYulz9MmGCIgVIgpksX447W3A9XWTGIW
         ohMrVYpz2k45zdWcKMHiakFm+MnaHl1J4gAaVVf4Y/sbFfNlzX8U+Jw/pSrXzZDRcc61
         XvLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrLmbam2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m14-20020a05600c4f4e00b0040a465112ebsor511434wmq.13.2023.11.20.09.20.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Nov 2023 09:20:14 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrLmbam2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700500814; x=1701105614; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mVIv7aU6HgSc0oGDYnX/XF6kJGW1ilVSANr7wEYc3ok=;
        b=YrLmbam2/AVD0DOvuIngHQjXtQ+XCnvO8oEtK7EKgvY6sosBTTLEczEFoNWC4AsbWA
         hwxNAHVTQJkGJnlEV7EOViUirZXKVyZQ62I9S28q4JFIFg39/j0xUmRttSNKdKGi6wxA
         GIfCO19n6a0kNmPo2yTK8cR791TxmyYmSh/yVVkPYhgcLGF3D53IJD9uNpnFV+IExYgf
         /0/e5lgRRKKVJmIZxj0xMgQ3KPG54qjkKsCnn9rR8SGzYw7MYB0+WTZ2a2+r3Eo4crDg
         aIxcsg1WwXTYQuWU/VzRpxrFKzFqv0z56mtsPILJobG2IDGW6aXeuaiNdE2EIQh+Tose
         ZMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700500814; x=1701105614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVIv7aU6HgSc0oGDYnX/XF6kJGW1ilVSANr7wEYc3ok=;
        b=HzRwWNtZi0JhVifzwHEK+V7ETe4J9sJGotD8R0O6mwmuejkgdOu0eBRNExc2iN74BF
         66IytSB8FbvwkCmYC+sn/o6GhTSR5a++Oi3/yF16dTf5baqtCFzNH4dM1lwDabctOANd
         tl1NGpfpsLSsYvljwpU6zjcZhgmdF3kj4vO1F3DA8V96JkQU7pGnlhkgWiA4vSLXsraj
         uzwEquDvaXu69wURHyGJbOi6KXK6wF1LUxvDF1QPLbVSVIthPvRPKNAthAFQ3CO0S60K
         vxMpZs5n4DxaSojh9Uoy+b+yaYO8tulrTAS6GAJcf5CoV+xXL4adO8fl+OZ2L7IHv0f+
         qg6w==
X-Gm-Message-State: AOJu0YxKfsaxxvcB2UdYWzumrl5LCSo9cWG1JHWsSuK3yKWuOWT4i3fN
	PHpoaMURZRZnzeWpu/59CHeIHjpRbSsxV9DE6SgFDQ==
X-Google-Smtp-Source: AGHT+IFg25w6dBe/5a41fVBVOUIE6RkZA4iBuu+rdt7GMIJiwIEhxtV3j0+KiiVhqDgKUYG7IXsjpA==
X-Received: by 2002:a05:600c:4f01:b0:40a:5b3c:403 with SMTP id l1-20020a05600c4f0100b0040a5b3c0403mr6475909wmq.14.1700500814202;
        Mon, 20 Nov 2023 09:20:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.181.190])
        by smtp.gmail.com with ESMTPSA id s11-20020adfe00b000000b0032ddc3b88e9sm11913173wrh.0.2023.11.20.09.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 09:20:13 -0800 (PST)
Message-ID: <9d6e92d4-b8e5-4bc2-9723-e80d4bdd004e@linaro.org>
Date: Mon, 20 Nov 2023 18:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] docs/system: clarify limits of using gdbstub in
 system emulation
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20231120150833.2552739-1-alex.bennee@linaro.org>
 <20231120150833.2552739-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231120150833.2552739-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ur95LyHEFp1K

On 20/11/23 16:08, Alex Bennée wrote:
> It seems some users will try and use the gdbstub to debug userspace
> inside a system emulation. While possible clarify the limitations of
> this approach and direct the users to a less head scratching way of
> debugging user-space.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Clarifies: https://gitlab.com/qemu-project/qemu/-/issues/1274
> ---
>   docs/system/gdb.rst | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
