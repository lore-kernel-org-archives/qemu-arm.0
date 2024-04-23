Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4883386ejd;
        Tue, 23 Apr 2024 02:44:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9QK9rWoVjcb/A4Er3ieYO4TJXYj/Wo6o1CVHaFLR6F6QLjLZBInurHH5RhL92jZkVc8lJO1eF/ENfY4pbYyhxGWYeDo5w
X-Received: by 2002:a5d:5f56:0:b0:34a:6ee8:c2c9 with SMTP id cm22-20020a5d5f56000000b0034a6ee8c2c9mr8584898wrb.35.1713865484276;
        Tue, 23 Apr 2024 02:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713865484; cv=none;
        d=google.com; s=arc-20160816;
        b=WtpgcnZ3fKzoYAdYVHYu718q9dvJlMMhyZk3t+qImdfIdL+P93rfvdxYi7JCRTU3Wg
         VpSU7sYX/JPh54/BjD3SI/KoeLsxpzJthFPGkWvOhUA+77lIfIeUmsRFBZwICpTR8R90
         WEaEMkFhPKtTw0tVYk0IPD5XoM7nqp3MR9n8BPW3YPBeF76GUKaWWrGOdTSG4L7GeyjY
         8qi2nq7OYe3iwHIJ/TxobqcdxHZmNElBRaRNFMcItaq3KyOg7myk7bWr5Xf2RHKfee+j
         weIwr/SEQsP6mkfcWblZkPEUY+8kHV+WdDwuuf5+2gwqszPyOFyeoqFRoCwsPmMvcvoE
         F9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=/5YkfIclMRXJBQ10DhHZv4dvYuxXj3Sb02ci8s2G4Ko=;
        fh=YFeHdwBz6EkOoIhTihk1+XSIluxF5I39u2kN9RXQmYI=;
        b=xbLjhKjelSktXT8F7bwmHe+gChIe+WyCnJVLtDX+Lv7Op0rM4VTZC5/ervsqiN4DgT
         gVBg5I9I9H1kqwbcSE4OZ2X/wyprOc1DxlifzAsPDSvxBHNwZPHL+bI0RCfnAuMK18+n
         /JDWgfL8LP+2mvYeJd+XknjqPd79wHKsglAySVjbbYcocHmYw0apehjxDmmsSWQAetGy
         Y1gN8Fi8PTyyR9YmaAEk6JZgoGLDxYPv94jAHHhN6J7YgV9QbTw+ReIb+0B5C/+R3YEw
         53UZcr+ULJEywVp2FPj9ZrlkoktugIdXX82Yz/wYLsf6hs5zKgqGo67AiVZdwwA0aTKb
         kvrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ui0M9csz;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q26-20020adfab1a000000b00343c40821e9sor3365599wrc.8.2024.04.23.02.44.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Apr 2024 02:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ui0M9csz;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713865484; x=1714470284; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/5YkfIclMRXJBQ10DhHZv4dvYuxXj3Sb02ci8s2G4Ko=;
        b=Ui0M9csza5mS+FYnhTiuPK1lgZxscmKHWcp64mgZ3S6sQFKpy6NCPgS94brSRUELSO
         VjciZmsucwSzZ6rD4JfeVFz5FV09H9eYy0emPlPWbFPfO/NPGdmfIsi7fYYiK+ZatqC3
         4Iic8CyrdHT5mufqMZ4Z203N2jK9Atdf+fNyn3A2FirJHso8ssKRxVI9ui/21517Gfi2
         p5C1IFfM/0tXoEKEH6pfxU8m4+v/d7KY6fb5WRoVIrAcmI88nf0fywS7guZoJhVkWn8n
         R6247px8/No0aOEfHt/zsSnbFLgu5fp4QRsoEXv5BRAmnh1ERSkS3MVlNLaxNXQsouKv
         gxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713865484; x=1714470284;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5YkfIclMRXJBQ10DhHZv4dvYuxXj3Sb02ci8s2G4Ko=;
        b=mE254ezOplLWc8BLp0yqdDvbSiJxcDsGCR9jtep3RhixI6WM8dtL20QnSw0YFeSv8F
         gS94gDX0p+sFLm7SzhIlhmFTCpCDmABC8jtYrxrO04z9//yXi/r4jVX98okIg7GYJoyZ
         +myb67T/uzI+kTzxAdmv149+RdIbjw/GSOu7OdVU62I6RfWHtplhFXKVVZ6XigqzN2gT
         wfWr2ou1/lW/C+btSih/IzAQ07N+v8pcle+M8HDjpVZhpmUnckC+InuGEeZuX569jO1K
         3Ciij3JvdaaLCkb5ih2P46CHlWRUiFVPRDMMDHL6pglUJ17bJhIRKNryf497kJF4WUiB
         fUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlTVcc60viWmqQo31gROalMgyEcJEGGUDDp/kFK2aiD1+oxV4LdJdKJymSjViUuryTALb+typE4Xyvn69i4WDOYfdVm6xC
X-Gm-Message-State: AOJu0YxY3jFnnnd/jm0qXgRE0tH2sysCgPl+qPDvUc34gN77sXl+PFZd
	GGEUuiaNpapemHbv3iEdWa48lj4JW29vHFKBuPBaLS8EGudFan3bgeHn1Zy2PSxmJA==
X-Google-Smtp-Source: AGHT+IGi7Z+UanzUq5fwY8gqpsHzrd+QkdN1eKnnOwNeUb/+PfB33DPIiExmAweOYqtkzOmsoBnSKg==
X-Received: by 2002:adf:cb83:0:b0:34a:4b5b:a4a with SMTP id q3-20020adfcb83000000b0034a4b5b0a4amr8497772wrh.47.1713865483382;
        Tue, 23 Apr 2024 02:44:43 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id l37-20020a05600c1d2500b004186f979543sm23576224wms.33.2024.04.23.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 02:44:43 -0700 (PDT)
Date: Tue, 23 Apr 2024 10:44:56 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, pbonzini@redhat.com, alex.bennee@linaro.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 02/22] target/arm: Add confidential guest support
Message-ID: <20240423094456.GA4454@myrica>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
 <20240419155709.318866-4-jean-philippe@linaro.org>
 <ZiKa6MQaujEMlC23@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZiKa6MQaujEMlC23@redhat.com>
X-TUID: W/3E3Wmv6hSU

On Fri, Apr 19, 2024 at 05:25:12PM +0100, Daniel P. Berrangé wrote:
> On Fri, Apr 19, 2024 at 04:56:50PM +0100, Jean-Philippe Brucker wrote:
> > Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> > support the Arm Realm Management Extension (RME). It is instantiated by
> > passing on the command-line:
> > 
> >   -M virt,confidential-guest-support=<id>
> >   -object guest-rme,id=<id>[,options...]

Hm, the commit message is wrong, it should say "rme-guest".

> How about either "arm-rme" or merely 'rme' as the object name 

I don't feel strongly about the name, but picked this one to be consistent
with existing confidential-guest-support objects: sev-guest, pef-guest,
s390-pv-guest, and upcoming tdx-guest [1]

Thanks,
Jean

[1] https://lore.kernel.org/qemu-devel/20240229063726.610065-13-xiaoyao.li@intel.com/
