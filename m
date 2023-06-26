Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp903262ejx;
        Mon, 26 Jun 2023 06:27:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5SHuvTvWDKEpNLZVC8mS9/i847pxSVqZlxF6JZWje9U9c81hT23izLdSHNhfSUKY7EiEUz
X-Received: by 2002:ac8:5781:0:b0:3f5:a0a:b30c with SMTP id v1-20020ac85781000000b003f50a0ab30cmr36888045qta.42.1687786078920;
        Mon, 26 Jun 2023 06:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687786078; cv=none;
        d=google.com; s=arc-20160816;
        b=ruI2e5kiSi/ulNXHZGRaWcrCAEO90sHfFsSSi9B+KBbbzszPmLXx4tfc4od3BYY4+/
         KJ+rZIWC5+h1cRBSX5bTkLeKeEkAuOxaPLfkdO4cvBsgnhq2NsqIdr/vzHDsxjwk3It0
         Pul4oAvI8PBUepCT74xPqS931OxXu0etv8M84uN4me2fJWALsasp4esAJmfSLJxcjhPV
         iOA/8H+2UkNAcFjyVSKpCBboaGYEUjUilFcO/ujWOwgi1CSJgU3zKK4jQF+2a/cbpkes
         /G1hKpdz6sx60MbGECu2KArMnGG0Qa28TXBYibhUdDPvakFy3y10iTuJUut7K5r9a3MO
         dstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OtKrSIn4YG4Jneb8ljOeRTxWL6q5v4yI+SCt392+1vA=;
        fh=Vykz0vHZUl+hHfhCnSJFTMGCMSUcDZiqeNYSt3ABtRc=;
        b=jpActkWofWzaTh4PvOrWrHObGkBRVcNMh12mwhB5nsdzA/xCfKKbVhDXq7kpLCOKxG
         ZRx7PQmboq1WIVB48I5q02rBGLnPwJXXt9sKwG4Wn17dejeSKTbQ4XlDfG2iaHNopx62
         SMIpTYvoxFAJP2xgIg/dqH/GFFL3giaw+KHqbZluQGaFQRzotrwQrC+9FxDUPAoxRejb
         7Plh1rXGoHJy8YeNm4e4m84z1Rrx7x9ccw21AiSyVqomootpAH+YIv9r9qdzTH8vbLCZ
         qh8/wonJJL9KVaxtB2wVuJqdMRsfZei0sqA/AT9coD1iqWBRniZSxBcVWP30oFBdc6HM
         qCMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="H6ulSTE/";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d3-20020a05622a15c300b003fde363ad68si502318qty.741.2023.06.26.06.27.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="H6ulSTE/";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687786078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtKrSIn4YG4Jneb8ljOeRTxWL6q5v4yI+SCt392+1vA=;
	b=H6ulSTE/HxqM5fgw5yO7oi9tmEq1N8MDE532o7XU+n+IqjmXTAyE/VLJTiXuXKV8oGnJr7
	zmTd4CdZkqbHrKhLJNK3xQJF5iDYltW+hmYIKoezfKOlzzzElPy7kMxwnnlghnpl+j8Adq
	9dyR8jNnHY9dNbAzhOLJQ8xh3JjfQXA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-SgcykiwLNSWSEcGeA1Y9Xw-1; Mon, 26 Jun 2023 09:27:57 -0400
X-MC-Unique: SgcykiwLNSWSEcGeA1Y9Xw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4fb76659cacso725362e87.1
        for <alex.bennee@linaro.org>; Mon, 26 Jun 2023 06:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786075; x=1690378075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OtKrSIn4YG4Jneb8ljOeRTxWL6q5v4yI+SCt392+1vA=;
        b=RzEmD4pxMeStwZBUbyBnhwccN1tq8VNXhQph7iYgdLjes3wFntvnKdcZFwfzhELEtW
         X9uTz8EdgVPnt4ZLGXCsVU1FGt6X+lPxi7JuZdAtBXvxP54eixsEDHXChEdA9ZaEbMr8
         GmF5yjQxmv/tLk7JWO4L9FnDMBj0nS/TCJZaZgQmHAoSh2vc3Mo4ZNrGTiv5OZLSYob2
         iwyr75TLZrhGHQ5ZIk39DZOjndYI0CHbQHuKQ4hd6KxmSQz/oDfuXxqr3pMQVC42vozI
         p6MgSbKEa+GLlBJmUyPNkE5QnTCIiJMl0NqcS9L+7PAv6eAaQ8veXL3KtxUyAdpo9r0w
         AiTw==
X-Gm-Message-State: AC+VfDzngCiiqFR72h1snvU+6Pyt6RR48ekaETXZ9eEIjkxLXDpbWzKK
	/n1IfPtTPq577uGDlAKAL3cKFAuVVlXYIJneJiX4vboGwgWLnDo/gWCrAZHzGluxUQIAUCqSYJf
	9tKuJintHmKU1TVTnS7AWZ/SJ+P1x7XEZlkoZ6MdMzC7vxu324uYL8PhB3vhGHGdRclPjnF3Ttm
	RN
X-Received: by 2002:a19:7b02:0:b0:4f6:1b45:e8aa with SMTP id w2-20020a197b02000000b004f61b45e8aamr16840696lfc.50.1687786075325;
        Mon, 26 Jun 2023 06:27:55 -0700 (PDT)
X-Received: by 2002:a19:7b02:0:b0:4f6:1b45:e8aa with SMTP id w2-20020a197b02000000b004f61b45e8aamr16840645lfc.50.1687786074903;
        Mon, 26 Jun 2023 06:27:54 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id o11-20020a05600c378b00b003fa95f328afsm3136331wmr.29.2023.06.26.06.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 06:27:54 -0700 (PDT)
Message-ID: <0c245101-77cf-9e9a-3c84-0293a75125b6@redhat.com>
Date: Mon, 26 Jun 2023 15:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 26/26] docs/devel: introduce some key concepts for QOM
 development
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Riku Voipio <riku.voipio@iki.fi>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Bulekov <alxndr@bu.edu>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras <leobras@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
 <20230623122100.1640995-27-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230623122100.1640995-27-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: F2WK3XYrgVxq

On 6/23/23 14:21, Alex Bennée wrote:
> Using QOM correctly is increasingly important to maintaining a modern
> code base. However the current documentation skips some important
> concepts before launching into a simple example. Lets:
> 
>    - at least mention properties
>    - mention TYPE_OBJECT and TYPE_DEVICE
>    - talk about why we have realize/unrealize
>    - mention the QOM tree
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20230619171437.357374-6-alex.bennee@linaro.org>

There were review comments on this series that haven't been applied.

Paolo
