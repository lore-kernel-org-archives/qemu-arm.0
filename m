Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp432092ejc;
        Fri, 13 Jan 2023 06:27:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuTuglkpfjFy068rNuwVvpBLnRTjWHHPWzxmJuo599779N445BQedexdOlJ4xr0qfE41AuN
X-Received: by 2002:a81:10f:0:b0:4c3:6d3e:3167 with SMTP id 15-20020a81010f000000b004c36d3e3167mr20811226ywb.25.1673620068441;
        Fri, 13 Jan 2023 06:27:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673620068; cv=none;
        d=google.com; s=arc-20160816;
        b=loBf97R525Q9p+4UwjDgtDoqfCj0CpWNOCO1DzsnRaOV7K7NSxljo0JqiXbcbAPaGj
         GrDth3GtPIjxaG2199xzgv5gT3fVoiKT1KEXh3Dv/1bIhbeVpjzDqB2jKyKUvKkfeNnw
         cxVW+wefzOYJ+MwH2jPx7/8UDmeWfcI99+nawpk/Z33w//DvK9W3xx19NNPsb/2FWaAm
         vnd9bfmIRydtvw1yaB+IwJ2IuJ3epZ8N0QoBai9EEpIuZ3UKcYPLlb0n9rr6vGZ2lS4u
         xNmHiG8URpdjEawKLeEBy5hvcGDAvs8YWG1UQgeW2F41B/idtc6+dy9rFGYivJN8AiuU
         YRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=shcFh22nF6EFzDZQbp+ujZhMZlzdg1vA2H9XE4J8C5M=;
        b=DCWVSz01KR/9BzqVhs/elBScL1+OxnTiTABXAkqOGIZdvNpHveRrsgvdmjH4pt8Yhj
         zMrriAo0zAWjH2KmwYsNxMBba8OurioKSrgP8rMXWN+zN8wV7DrIBNUSaiLddMN1eS6W
         rxllwvgqaooU1h8mdqEypNNPIkylh1NDRlRdQLWhSJMsOKEzXWX/dtDYC75QL5LlmgnM
         eeIYsvTF9/PJ0eNkPefno6dn0fDy2bF5E81uNFEocUvF4kJKgdOhOrB5O7HZ1aVdqdbX
         LcwVSUH7wugZ0ZkyYWdKvExp6oLx5HdduiaHz9OtLnJEbTau+xNagm++SVhyea+s0PFV
         XRFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CxZg1Fk8;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u84-20020a817957000000b003be6574bce9si20927982ywc.536.2023.01.13.06.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:27:48 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CxZg1Fk8;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673620067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shcFh22nF6EFzDZQbp+ujZhMZlzdg1vA2H9XE4J8C5M=;
	b=CxZg1Fk88zQTlRJwrw6qIPKcCCCcjvtYRFzSa8fxXFo8ftfe6F2jtupTf6ZbM4oDcTyhMH
	HvTud8vREGjt/cnw3RmJoWl78HLc4MllVhhhj9B/P2QrPBHiudOO5iJm0FJQRLL7LQwnaJ
	2avJcXGJd7w/whrUyPMAtqB4T52BzFU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-17-4VzqAh-VMP6wvEpX2bh5eA-1; Fri, 13 Jan 2023 09:27:46 -0500
X-MC-Unique: 4VzqAh-VMP6wvEpX2bh5eA-1
Received: by mail-wm1-f69.google.com with SMTP id g9-20020a7bc4c9000000b003d214cffa4eso4950102wmk.5
        for <alex.bennee@linaro.org>; Fri, 13 Jan 2023 06:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shcFh22nF6EFzDZQbp+ujZhMZlzdg1vA2H9XE4J8C5M=;
        b=nnw1fXxVtcAyr0+Iw94E9WsOe9kwql0WHWO2ChxbIfEo7wk0a08iMi3on2+C7Gl5LZ
         gnI0wQ0zKDGpcChszSINaG6utnOUepVMhWoCYE0nL5ZKol5Ymx2Dy1ghsRI6r3OFzuuB
         xOJO9cWAXcaiZVcUeYncjC6aD4YwLiFLbsQsImMcmNOIgPHuf6rtcfGDc2e4wlGVxCtC
         EZSIZnfFq+GzbYS7Rnmo42Cv1KDDWUCT7vQ/7hfs64Hghsc9k5ycnEYLeD+Eo1P6LS4E
         ox1rbUtEraoJz9iaQYchYlr8yNPGXZGY5aCUOtJFL/s2kkyRtXKrBbBdH0AHsjDlN6Sw
         b+6w==
X-Gm-Message-State: AFqh2ko7RunrS2s0QQAwHV66ijetda7/rSd4Uu+/pexlCySWGAplcU+X
	gMMEYvk0VDtW6dkArMe0vnSI7g0bsYaC/L0nIBsITzp0q805BzfFhkXPP9LHsAyOZX736hZFSEi
	676TuZcat7a38xPZ+
X-Received: by 2002:a05:600c:3b9b:b0:3da:23f8:f028 with SMTP id n27-20020a05600c3b9b00b003da23f8f028mr1831878wms.21.1673620065797;
        Fri, 13 Jan 2023 06:27:45 -0800 (PST)
X-Received: by 2002:a05:600c:3b9b:b0:3da:23f8:f028 with SMTP id n27-20020a05600c3b9b00b003da23f8f028mr1831862wms.21.1673620065622;
        Fri, 13 Jan 2023 06:27:45 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-39.web.vodafone.de. [109.43.177.39])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c154c00b003d9fba3c7a4sm12122188wmg.16.2023.01.13.06.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:27:42 -0800 (PST)
Message-ID: <60747f19-91ca-403d-29b5-c205141c7047@redhat.com>
Date: Fri, 13 Jan 2023 15:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v3 23/28] tests/tcg: Do not build/run TCG tests if TCG
 is disabled
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-24-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230113140419.4013-24-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: L4etHS3pXCb6

On 13/01/2023 15.04, Fabiano Rosas wrote:
> The tests under tests/tcg depend on the TCG accelerator. Do not build
> them if --disable-tcg was given in the configure line.
> 
> Test against CONFIG_TCG='' instead of CONFIG_TCG=y to account for
> CONFIG_TCG=m.
> 
> sample output:
> 
> $ make check-tcg
>    GIT     ui/keycodemapdb meson dtc
>    SKIPPED x86_64-softmmu guest-tests because TCG is disabled in this build
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configure              |  4 ++++
>   tests/Makefile.include | 10 ++++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/configure b/configure
> index 9e407ce2e3..a6f9892757 100755
> --- a/configure
> +++ b/configure
> @@ -2352,6 +2352,10 @@ if test "$plugins" = "yes" ; then
>       echo "CONFIG_PLUGIN=y" >> $config_host_mak
>   fi
>   
> +if test "$tcg" = "enabled" ; then
> +    echo "CONFIG_TCG=y" >> $config_host_mak
> +fi

Commit 8a19980e3fc42239a moved CONFIG_TCG to meson.build, so this looks 
backward now ... could you maybe simply make sure that TCG_TESTS_TARGETS 
does not get set in config-host.mak if TCG is disabled?

  Thomas

