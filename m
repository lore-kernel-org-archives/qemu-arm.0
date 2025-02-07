Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp288540njb;
        Fri, 7 Feb 2025 07:55:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUizWOA7Q+buSs1HUtpFcLSMPRj1ibSkWESwULTIbYLWTVgFxu9DuFXtx+bRXbfehwHUabCfgFX4xprGA==@linaro.org
X-Received: by 2002:a7b:c319:0:b0:434:f586:7520 with SMTP id 5b1f17b1804b1-43924a27e47mr36927165e9.6.1738943755374;
        Fri, 07 Feb 2025 07:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738943755; cv=none;
        d=google.com; s=arc-20240605;
        b=Z+akBxbTl9vO0ytRAhFkrHgdx3nrEI2zkGouBgwgA3B4xXTYLkrDb7IsJGqfTyiteN
         Xqo/Q9QEYRvRvdLuUk7+zm41KE+Ne1M+kVNBZDO1+4JNuuX1LVc4YOws53j7OqutBmld
         JLM+C0ZGvL6ipnK2WyERuaWvoFU11S3ytQgJWBMIy47zY7zyNGB/FbEopDJf5XMcA2RF
         OpXMTwAOmIqLyMa1RW4tOLt9O0A9TNWYzGz92Rx8Ex7/32HXC3M+vlIc6ewwWQWuUe9C
         MKMRUO6jbEmTJDZz+0wQO4Xs2pYHUZ0lBSqIq3OouuseJpqkxEAmcLauXfKTns1JkGQC
         zHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=MSZ4dptb/XUGTZW9l+GO3/6hfDdSF+v7Rw+rW6p9JN0=;
        fh=V85LaUk2rJdSRMg4btJ3jnrZWmrG6UQYHL7ds898PTk=;
        b=BokZrS26wN3HZOmKl2vSatpTh/CPAix9BaOQinAq8pA4Jn7QhnP/7z46H2Wk57xXd8
         8gNrCOvzXMejl8NwDLrjmVQ2T8W27M6jCDVFbrdFRC2x0Jp6Vxcjhc/4sCEb/ghL5rfq
         ifC5Pb7PcR2a5eDwC1LgKKZvT3KDy0xFSwDq20zA7vBoD4zWWs9/JEXu1QaMaT9fOY0D
         ox+oMLqMrWj2Qpz4lGe6iULv5Ww6ei1cbFOmZdUd9AW6MpHeThU9CNDMdYPc9zrdhbMO
         Dmh4iF0DqFMX8gxom7Ci3wW230wEHT24EvlMZ1NIFj1guYgwUP4iPa7WEXPSl4zK27KA
         gX5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZMTHzH0C;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4391dff60e3sor21142535e9.9.2025.02.07.07.55.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Feb 2025 07:55:55 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZMTHzH0C;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943755; x=1739548555; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSZ4dptb/XUGTZW9l+GO3/6hfDdSF+v7Rw+rW6p9JN0=;
        b=ZMTHzH0CsTlPNukAppn3HZ5c8UtlN/Lsxc2OatyN3HEyyA0zeoMYl4s8Se7wHVcUGp
         1Sdg4K2Jye0SdOJGYgRazX81I+9DKtChSXQSe7ZLErAOLgMi2bz6fQZz2tsn4JitaL5H
         96DL20RdJVT1z6XB6bRikOcgbWdMkxZC7IxmL4H2iniYcU9ZSfYu37hO8rFdroD4RQ20
         ACZ1D9VSF0QzNwT+A4oshsPh9WARs9isqlW9x6FiU6dFZ1WdY8gz3yONxPj3dfuwvph8
         D3uWv/la438xdIZ7lyuY4gsy537UJF2S0tgTGEbVUdgsCX18DZdoM5Y3XSW4w27ruYQg
         nobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943755; x=1739548555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSZ4dptb/XUGTZW9l+GO3/6hfDdSF+v7Rw+rW6p9JN0=;
        b=OVV1gSHxsTGlUTJ0MNB5cwaG09xiNs7wQ10a52tURCvnKfkNO+8KIiSz18l9TdWErH
         NHFWSZA1lNJblNpDBUiBPd44dfA8SqyrJcB4qPrZCpJRtBr/dukCsdFPk5hfhUppvjq5
         4cV95oXtbA4UBKO01VGWOq3DO/0iGRkNKX9tR8QdVL0pF3KXORCGGmQth/FTrFwxIIRj
         3TX31qe9dvWcAWzVADIHL7/YFY+vi+GH5dDlz2S2f4azH+xWOWXeuB4shBd3940eLk8p
         WuggqWUEgDwo8skklC865bU7Jv9cGfcM+gOJCvfkNr8gPg1CcifgHUCYLcYWoU9xWUXs
         KX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2VxvfQ5Op6rNfR8D87ZX/8Y9ZogvaNcjX0Tnc8LV8Xco0TkKIWkUrpiw+qNobmZh2AyynZP6meJxTWQ==@linaro.org
X-Gm-Message-State: AOJu0YzPuOuphTLUvnnM8Vo6GkZrAX4I4RGuKNKaZEFlHr2xjCnXwiTv
	2EaL79mhLvTvFGkRmwo+ZSq5wWsQomLF8LLKo7kKcadfzQccnlKQ30Ee3bpi/vDplQ==
X-Gm-Gg: ASbGncvaJqXHs8IP8xFQ51FazEHSfWzBcdfEoY8MHhWcs4InpCjz4YDugFhpJ8/NRUV
	jtgQpPlzv7x4mRcNmiwsf4c7v6yHfBkv/fObWQVocc7X7x2e2o2MFa5bEYCk96EcUoLwU6FXyqs
	InPMa3lk9RNtV1klTofIn+H+V7i+808Myf/X1uOhiokskFXJ0qwHmEPXFIYHjeVHg0UXaSXmP+t
	rJPdm0YIFi9Zm6u+HniSnuv7uSaTYiXdXNx/6jdhtih69ky+Zroc+CSUFl+SHSNM6LPC7AS2p8Z
	iGZs4LnhUgjE6w==
X-Google-Smtp-Source: AGHT+IGH7xY+Rmlbrhod6MMhjMCRL2N2l3zbaP3gJ43PnqqCRx3iRViMR60etQJqTMEk1LndR6IGig==
X-Received: by 2002:a05:600c:4f8e:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-43924990cdbmr41947565e9.13.1738943754861;
        Fri, 07 Feb 2025 07:55:54 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc0c5a894sm4336016f8f.95.2025.02.07.07.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:55:54 -0800 (PST)
Date: Fri, 7 Feb 2025 15:56:18 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org
Subject: Re: [PATCH v3 06/26] target/arm/kvm-rme: Initialize vCPU
Message-ID: <20250207155618.GB3546768@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-8-jean-philippe@linaro.org>
 <abb2bf76-2548-4c2b-a971-502ca623aee2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abb2bf76-2548-4c2b-a971-502ca623aee2@redhat.com>
X-TUID: pH6xGvBlxomg

On Tue, Feb 04, 2025 at 03:02:41PM +1000, Gavin Shan wrote:
> > +    reg.id = AARCH64_CORE_REG(regs.pc);
> > +    reg.addr = (uintptr_t) &env->pc;
> > +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> 
> Nice place to use kvm_set_one_reg(). With it, @reg can be dropped.

Ah indeed, that's nicer

Thanks,
Jean
