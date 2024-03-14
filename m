Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp371033eju;
        Thu, 14 Mar 2024 07:28:28 -0700 (PDT)
X-Received: by 2002:a17:906:eb0a:b0:a46:59c6:2a42 with SMTP id mb10-20020a170906eb0a00b00a4659c62a42mr1301734ejb.76.1710426508350;
        Thu, 14 Mar 2024 07:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710426508; cv=none;
        d=google.com; s=arc-20160816;
        b=I1V6K4DIgGJDm64XDm8v0b7+r+4Y/t/okQiMbO1QWXnaVcUVA6650xZjZtKWLO6bag
         B5Eqy+3b5HJICQzXnpaunbfpxoVLnzWWkHZNAZ1GMEs1AxMc4hWWz6Z5OGf4SGNh9JZT
         lTGa4BH4KNzzC8AFq3dG2YBpjNpkZfT1X57dz+ljRjAq9/kY4GKc9pxiyrvDvt0JbaMT
         6s7MP2RdR7Amq+e9XzohS3lzVKIPqRwljQoUg7xfyae1H1gP2K3KgPEy6k1BLOkStlZA
         e6nj0KhydTACG0d5/zr5Yjlb9MSHIoU0T6AV3ZEPE63o/BDUNt7j2ctSkIQJkFF4uUr0
         NMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=i7xc7pS6F3jcTF6TJfq3ZHnKHc45oSB+aQCWg+Hj3P8=;
        fh=4RHjauD5AzAXnL7gh1ZGl6XNQvm8HRRRM/Ed4jtntE0=;
        b=tW/hxnotDSZcXa7ejaf/cml35hS0bVKnxxjO3vJNgRUy/aw7uM88MZhXjqUq8oDgwc
         OZiWoX+y9dtfpdibDfOCmT5MVDpG+VfpQlU20VwMeKVd0Z7IkmzxR5QURICI8TnMXSFt
         6SHeyBEVI/v+OElySz+V5C9fk4lsyH25BAULk7reuNhwso1is8fAK7V11gmFCUmgmMPn
         fLNeOgWmr7CPvFh3suE5C7aMa/3mimP20maxX3r6FW+ujbNz5R+3s1x4+nEAknlLJmCB
         ChhN3+CBsvay4fODadeq47ReuiVZBbA3mMJL0FQJvVX7yI/DZqDD038R1iTTrHMIdUj1
         wicg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oq+Sthc3;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bw17-20020a170906c1d100b00a456839d194sor540480ejb.8.2024.03.14.07.28.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Mar 2024 07:28:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oq+Sthc3;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710426507; x=1711031307; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i7xc7pS6F3jcTF6TJfq3ZHnKHc45oSB+aQCWg+Hj3P8=;
        b=Oq+Sthc3L3XO2NN4Ql0i/QPGVgWd0aRNDYfJZIFwLsz77kl0QdsylFT/TLr5GAnIVv
         Ku5/QGPOeZFJvdTs6DfLMjxy7K5mkcC3sYW/oy8O/ot/eOZxaZ+ZTCcaKSSEr1/moOWZ
         DYjLJ2mWnv/xyWGfb5QTVsmp7as/plcHWK8AQJ+eEJenubM/Uuj+5qd8Z8MPof/9bAq3
         OZEC9vg2Ndad0pkrBrJLALJDsvEZtg5C6pytduIfWywvfsiPFD7VxvQbqv1sQIlEMcyK
         TNPrc5JYUKgiNG7kfFMmgjVkcX77Eh58l1YnAT73kQhryHeEOfN7mBX1J5Yy5mHLdK7G
         h3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426507; x=1711031307;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7xc7pS6F3jcTF6TJfq3ZHnKHc45oSB+aQCWg+Hj3P8=;
        b=PTMMT/pvzkhNGVhBmM3mDo9zbuNjZS0j2pDjx3q3s66G1zuID3YwaiL1P/BEN3uQrN
         VQwM8Pmqx11uAbvMcbJbFIYYsYBsqY5r/pI7VRxR+H93DQPqUX6Zwmw4vZ6utSVhulqM
         Hlxx2R4eRzFPUwNYNtKV1vtvZ0sRI9a6JtkF6fMu2lmM2pwcu1Cj90LcKNk9mzILc6Kb
         NVWj2f2+oeuz7mS5pd32b91kQTxYXPgU3uE2++NeUIE9V7HDl7lcb0vGEbho78VChnuq
         SoMIzbf+lrx5HAuc2QPCrzSxPHt/Ciib9Cs7ROIimRXJwpzg8rjikImQirfacD+p0S7c
         6dyQ==
X-Gm-Message-State: AOJu0YxHJEoV97uzLyan8DWbanjTCKDeNn1mjRsQdLRp9PmHTo4hN7uK
	Zxp0wP0YIaQdouOR5sCE4LLK3RxnI82XA4ed7lU7VKum8RUbLQaAIunedV7cYcVeSVv0H8XN7Uk
	mpWvOSA==
X-Google-Smtp-Source: AGHT+IEK1ZxfiOuBzAlxM880gF0382rndq2nqsWuUaychIvSogXSAcqwFw5jJqQkkxq60OtLJILCKg==
X-Received: by 2002:a17:907:198e:b0:a46:7929:8850 with SMTP id li14-20020a170907198e00b00a4679298850mr741109ejc.39.1710426507665;
        Thu, 14 Mar 2024 07:28:27 -0700 (PDT)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.200.106] (83.11.22.169.ipv4.supernova.orange.pl. [83.11.22.169])
        by smtp.gmail.com with ESMTPSA id gq25-20020a170906e25900b00a46636af78dsm757230ejb.100.2024.03.14.07.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:28:27 -0700 (PDT)
Message-ID: <fe009721-1eb7-4472-8ac3-e0482240a202@linaro.org>
Date: Thu, 14 Mar 2024 15:28:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tests/avocado: use OpenBSD 7.4 for sbsa-ref
Content-Language: pl-PL, en-GB, en-HK
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
 <20240314-sbsa-ref-firmware-update-v2-3-b557c56559cd@linaro.org>
 <87bk7hggcz.fsf@draig.linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <87bk7hggcz.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HutuW9sUHlzR

W dniu 14.03.2024 o 13:14, Alex Bennée pisze:
>> +# OpenBSD 7.4 does not boot on current max cpu.
>> +#
>> +#   def test_sbsaref_openbsd_max_pauth_off(self):
>> +#       """
>> +#       :avocado: tags=cpu:max
>> +#       :avocado: tags=os:openbsd
>> +#       """
>> +#       self.boot_openbsd("max,pauth=off")
> If we are not going to delete the entries then at least use a @skip
> instead of commenting. Maybe:
> 
>    @skip("Potential un-diagnosed upstream bug?")
> 
> but it would be nice to figure out exactly where is breaks.

I am going to subscribe to openbsd mailing list and ask there.

OpenBSD 7.3 works, 7.4/7.5-current does not.
And it is on Neoverse-V1/N2 and max cpu types.
