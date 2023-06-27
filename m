Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1279608ejx;
        Mon, 26 Jun 2023 23:51:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ582S+8iBtewhgBgiCb1Cm+Jnz2GrWsFk2nhBGQK8z7FIzUGOW18hTZYQnyivPpDPhs9bS7
X-Received: by 2002:a05:6214:e6c:b0:635:abf1:e93e with SMTP id jz12-20020a0562140e6c00b00635abf1e93emr7799207qvb.29.1687848666524;
        Mon, 26 Jun 2023 23:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687848666; cv=none;
        d=google.com; s=arc-20160816;
        b=cbdu0LC+m7B2uYsdqCUClCAIPe0wu/zcAmqqSihJoyd8aWnsHwvjxDIpIV62fxEXAt
         jwBTbBSZax4IWMVCozgK2OKqA67ONj/77dIRtyLlmKLKD7cOlB6tNxlYlfLB/LL5ie5U
         yCGHZuUQQnmKIHSLo8CGG2CmK+uw6NezMLONuf3r5aREnP0/n/gARulDKH0YyYoai4Db
         eNJXzaQgF0w28jmbpyoWuYwlG/fTfDh/QnN7s5ixSsk2mJ4f1RCvb0AyLmo5iFgA+UwG
         LqqCF3S3rsBRYT1X5G1N/LZC7AqIfDtHvdmb9H4718JvCWckcruZqCGT9fW0n3WviTU+
         DhDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8esWfM1EaffvtAcKYoSgMPRWQGQ589HABPWbkZrMFT8=;
        fh=1MNDPgjukH5hysUq7YBxRbXN6qDG9oWyz/cGIZdYuho=;
        b=uTYZvv3pyz2OnOiBqLOtdbBiVSC0FRHorO4IRGJ9PXA5QMIzrt9pgucPpHEM+hdIKL
         UMf57AYGlRaablwLVCB8bpNB2UiA0sxRNQU14Jo8SIB8g9PhGMgPseTyXQ5H4G9ga5XE
         MYzMr/gMhNhb3rb0ZN4y1NjpCV+hY5XrSKpNNARB8JQFop0Yy2xQsGkA79tAsYmNMeDL
         UoRxnkXvz35CVQYse7TQQ71322xtf5iEfuUPk3u89hiIH0IqhxzlVPyNCM8gtaAbut4W
         SKua1FLOqHjPIWlfc/Cy5X1QmY6NDJ7VbtjK7b1yTEQpyxIf01PGS4wS0fxht5qNtuDY
         AGHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W3KjCkQ+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 12-20020a056214202c00b006261bd7a355si2813477qvf.375.2023.06.26.23.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 23:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W3KjCkQ+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687848666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8esWfM1EaffvtAcKYoSgMPRWQGQ589HABPWbkZrMFT8=;
	b=W3KjCkQ+QFLX6AHTD7TKQyiugm26oYVfr97HhG8sAwLL028XEJedPAx5T1qHje5gATd7k3
	UmcOJ8CHH5H6rz2MzMhMlAbWLiZTJer6CpqaI5SmiyvAEFSljlqEPh5mEns/N759i63nl1
	WdY/S+gzWeScOM5PcBtoNzVERZg2bgA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-5OQEeaaAN52d5wn7bb0lGg-1; Tue, 27 Jun 2023 02:51:04 -0400
X-MC-Unique: 5OQEeaaAN52d5wn7bb0lGg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-621257e86daso52311586d6.1
        for <alex.bennee@linaro.org>; Mon, 26 Jun 2023 23:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687848664; x=1690440664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8esWfM1EaffvtAcKYoSgMPRWQGQ589HABPWbkZrMFT8=;
        b=QLPQZw6N/UescN/TmDNBB2srmTNuW1xvavO5URtnd8AsIMlH6sFE8zcN5mDD15tlQP
         s2V+d/SUo05K3s+b8sLs0ccNeFAdHNSlr/z/jQo4zhXkQMnwR0VNfTOainxKF2LhyMQe
         +H3O4NzmDgRbri5pMh9PuW4/+Tn/cA8i/d8P5+HRi6Z6nFEGKQMZpNm07SnFULhBOEQz
         hKqiFCu/79ypECgxAFNgtzJCCHTVWLTfmJfHcYusApTD2WRyJ1sRAZ1oW1e2gJmtvEtv
         NXx8QcWTytH3yhXiUU+mc2k96GhR1858Xm1zkS2KMGx7VOTvHpY3zAwiz7yXXaBmyG4y
         lLEQ==
X-Gm-Message-State: AC+VfDy05D7VhGIG6na9HEtqufzrHBXukuf0GSnET3WFoABNm0U/Dmo9
	mYm37NWuaBxLwq0fm4NNAmETMHRwSGlPpJnChoBnLAzOtX4Vw0XUdrYZ5EKHeKRtL97xS6tyMMy
	VyYizTuIIst3NfU+ZvoHRzwhUkuOPKvAqoejhzA/jvbVBhoEbUXga/N/UtsBcuqXYIw5xGxog
X-Received: by 2002:a05:6214:1d0b:b0:62f:eae4:b2cd with SMTP id e11-20020a0562141d0b00b0062feae4b2cdmr40354995qvd.16.1687848664191;
        Mon, 26 Jun 2023 23:51:04 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0b:b0:62f:eae4:b2cd with SMTP id e11-20020a0562141d0b00b0062feae4b2cdmr40354954qvd.16.1687848663857;
        Mon, 26 Jun 2023 23:51:03 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-179-172.web.vodafone.de. [109.43.179.172])
        by smtp.gmail.com with ESMTPSA id pv16-20020ad45490000000b0063019b482f8sm4159639qvb.85.2023.06.26.23.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 23:51:03 -0700 (PDT)
Message-ID: <8d6492f6-7558-b496-c8c0-54591ddae777@redhat.com>
Date: Tue, 27 Jun 2023 08:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 06/26] qemu-keymap: properly check return from
 xkb_keymap_mod_get_index
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Riku Voipio <riku.voipio@iki.fi>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230626215926.2522656-1-alex.bennee@linaro.org>
 <20230626215926.2522656-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230626215926.2522656-7-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LOatgAi6Hpnv

On 26/06/2023 23.59, Alex Bennée wrote:
> We can return XKB_MOD_INVALID which rightly gets flagged by sanitisers
> as an overly wide shift attempt.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   qemu-keymap.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

