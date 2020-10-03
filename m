Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2316042lfq;
        Sat, 3 Oct 2020 02:15:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCgdVmM2VH4/hX9cnPuY1SSS3Gb3ySzxScp9aS4pQRuiCqKPqtrfrXUy4d4Apix6HvKYsr
X-Received: by 2002:a17:906:60d6:: with SMTP id f22mr5782476ejk.250.1601716521178;
        Sat, 03 Oct 2020 02:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601716521; cv=none;
        d=google.com; s=arc-20160816;
        b=PKvK92tlgj7dbnwN2EuDDirR7DptuvMlvI8NmhQAnNJ1EYbW6Pk3jV2Mh3B85KkUca
         DSTd8ix4seTf/AdOceaGUlyl/t1VKuruuW0qeejaSSiDMw73/g3Ab1SKMTmm87/CBR9/
         dO/UBDeL3/upK12sYt+DZ6do71pFFgnlL/DvHJFdFKOBV2W6MIFHHB3ohoGPkg3qW6SU
         vHdXe3uHS0qCXV/GoJDKVd1XLlbltGAcTQgngvKiuy8Kue1fLsnhRkj579tFBbYohQZA
         EkyDAc9JqI6V/qJmU3dSNQU+KE/n/rZjXMtpNCj7ArN1vLEJJY9zzQbZjHpu1tr/WuZz
         2m4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=aqKUOGkrbnr63pzYqTB3ZzHYKIeURmurnEarIe7Rvvs=;
        b=xhFL2+5c+3XpkneA4iLCvKKi43YZ2icGoKktn89Gvyallj3mlkxd4kKll1n8R05Wz0
         nw8iBnXmlrjqZkjZ11VGrCJd87CqpY6yr8Il44Y5WJzxZmab7n1H/sajRQPdJHhOQ2aj
         T15jTi1ZHGWL11DsobvO/kDekgKKHXMJnlZ/7KO9K9qZpFCQoCDMn7HfWobzKtJC0F4F
         8zr6pdAamwPjQMA/Wxikq3DDGZ8JNfnxT6Vgzn+RBv48J/yQ8hSMDj5HNshgT7iYdbJQ
         dhQ6HHiJHjmQSBaxkT7nlSKlhZHhTN3oVCHo/ouls3jjA6RvkkqqXkFgXvsFdUXz6OAt
         sXrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MMjF4IRQ;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id b5si3073726ejq.317.2020.10.03.02.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:15:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MMjF4IRQ;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601716520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqKUOGkrbnr63pzYqTB3ZzHYKIeURmurnEarIe7Rvvs=;
	b=MMjF4IRQzRG46yFAg3mnwN5Lbl7yuZ6ZzQedpre4OIDviCXuaQz9Pfuazcv9Z3GO/4AUs4
	9rj+v2sMEETHM3USamLQXOzF3gLYoKdpp22Kxv6Xh94qHXofFbGHmGAoaN5K1bnIEz8TaL
	gNOXpV2iixEky6byTAYLIjoFBZwizYU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-5fH-qh0YOzyOo8UKu1Egog-1; Sat, 03 Oct 2020 05:15:18 -0400
X-MC-Unique: 5fH-qh0YOzyOo8UKu1Egog-1
Received: by mail-wr1-f72.google.com with SMTP id d9so1606079wrv.16
        for <alex.bennee@linaro.org>; Sat, 03 Oct 2020 02:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aqKUOGkrbnr63pzYqTB3ZzHYKIeURmurnEarIe7Rvvs=;
        b=XGAPQZjkukn3zo8zfbhd0emdQSAs6lbQwF6MO17kc2kCkEkGMYonPFI6GwF2Bu3bCo
         DrafpD+jDGBPBnry1fstXFXTNG1Xv78DAtD2tLAbJ/Nsc1x6SZSAQUqrhvEeJbBt4mHH
         9Ymg9Avzc+PQ2aTzjFe2nhuwyh85q1Docr7UWwMiUlgzF8M5QRqISTGXoNnJN974uyHt
         WROO6biS+Xk6O+3NpfOe6hnIicHvHBtYyegBSdZiJ593b/SqusXHI9fGOyYVWuWhPbWv
         9qnNmLewfqy8pNJuaUOQsMoAKrUsQxZo42B0en3JYEd85PxTmDnCpbhKJDplXgSuyZIN
         wFkw==
X-Gm-Message-State: AOAM53266r5uon/adLZhY3drrWspramORRsTDUqfg4x/AxtszxIVoNJX
	rbgvNDEYe2NxQuFF9egbsYawW2kt0x3I1BwXpAi7SMhR93Bxl7pjMwvgo9UspVHbsQbecacCI5v
	LztJupXFK7OIREYq6
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr6672795wmf.37.1601716517509;
        Sat, 03 Oct 2020 02:15:17 -0700 (PDT)
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr6672777wmf.37.1601716517335;
        Sat, 03 Oct 2020 02:15:17 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.150] ([93.56.170.5])
        by smtp.gmail.com with ESMTPSA id n10sm4714605wmk.7.2020.10.03.02.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:15:16 -0700 (PDT)
Subject: Re: [PATCH v4 02/12] meson: Allow optional target/${ARCH}/Kconfig
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Claudio Fontana <cfontana@suse.de>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-3-philmd@redhat.com>
 <31a173bf-6aa3-1ce8-7d14-5e8f11e2a279@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0303fe78-5ae1-2115-247c-71807ce74e12@redhat.com>
Date: Sat, 3 Oct 2020 11:15:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <31a173bf-6aa3-1ce8-7d14-5e8f11e2a279@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 9yJngqa08BAW

On 03/10/20 11:13, Richard Henderson wrote:
>> +    target_kconfig = 'target' / config_target['TARGET_BASE_ARCH'] / 'Kconfig'
>> +    minikconf_input = ['default-configs' / target + '.mak', 'Kconfig']
>> +    if fs.is_file(target_kconfig)
> Missing a meson.current_source_dir()?
> Leastwise that was a comment that Paolo had for me.

Not sure, but it was the only way I thought the BSD build could fail;
unless the capstone submodule really was not present in Peter's checkout
and submodule update was disabled.

Paolo
