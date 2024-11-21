Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp4344639dll;
        Thu, 21 Nov 2024 11:02:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEF4hDwNgpwJNnWS83gMeHpPHCn6S0IbApASk8/zqg37eVqDn+Sg8IfpCSxWeKIj+8LskCy
X-Received: by 2002:a05:600c:3b12:b0:42f:75cd:2566 with SMTP id 5b1f17b1804b1-433489878cemr76398055e9.2.1732215741301;
        Thu, 21 Nov 2024 11:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732215741; cv=none;
        d=google.com; s=arc-20240605;
        b=IE2Xp+44I54sl5MekTzmkMGi+Av1GMbsLBbTOKQOvthe8vLEvJVUFcZ+gkLY7TobnB
         BObFcQR7eCKhgSjEVadyGlRu3Qqr1jLFk8CzJYlW1C8uwddQWZrRxQcaNEf4MrcTs+W6
         TL8svnhsHsf3hdH9dddn18LbdOAxlDXPSzHdIH/kYscGVr6AcVvSeB+18/PUmm1roM7G
         oQqR81VTu3KWSWyrNql/e15wWSqQNRFkjxfQghBeXQVAeUEenGfT1SNRZcG4B13Sipzu
         NnR5iKS68lNN6tqkbiAwhifDDTlzc+G6Pdv9R9adIUz1e9T9p6f48T2udtoT+mZPqSNj
         1CJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Mhl4JBBgEDPMNbSymbtoH0R+ERhP+4wdK9miXYr5aak=;
        fh=wVPQWqTxHsMhgDFUYzS4WRCfPsDqkM1sZVnXLJCyo1A=;
        b=agHvcj8cVJBHLZGbf17F0Q5cnQD1VsoeGLVJTRy2qnlzZ7iyJgg9KikJOGdTW9gxyT
         nXqmqonG2tquUCFBZKR/OjHJuiaulPdw/lWAm4km7atwrqJTflTNY8PiTkWhrDwMjA3X
         0YRghZGF/bjxmB3sGlcWh6jjJXX3EB8/nugL7Y4SGoudKIyawTUxgjDvjTEF7cCaL+BC
         /NoQUovVxH44WQA4+bzBquyUjgMuJm1pzBGlvl8qCUNYzNpddRz3MrJ4KGitRHQfBG7M
         zKjzTSTRNl4AAiA12GD6Pzv8dggduTZjn1/4W4W3O/goW7cCBdfuBZtN95eRPVkkB6k+
         UWXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dCohTbSo;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3825fd277dasi151986f8f.422.2024.11.21.11.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 11:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dCohTbSo;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732215740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Mhl4JBBgEDPMNbSymbtoH0R+ERhP+4wdK9miXYr5aak=;
	b=dCohTbSoNYhmyd+bOLzSTTZHZ6Cm+bocnM7k5igWpv2GKezXzPD/Hwjkudr8aUhWJi3LnW
	p8WoI+6c4+r+LYdPNaOIaiXPJZ1BlPjeQYtfrLmgGjxm0Z+rtX5tIrYmaaawaNSbILKfFG
	pEH3+PJrsUIKLsB69xvkhlGTwl81b7I=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-HAGAcaNhOHa80tmCU_Ydpw-1; Thu, 21 Nov 2024 14:02:19 -0500
X-MC-Unique: HAGAcaNhOHa80tmCU_Ydpw-1
X-Mimecast-MFC-AGG-ID: HAGAcaNhOHa80tmCU_Ydpw
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2fb58c0df21so8114991fa.2
        for <alex.bennee@linaro.org>; Thu, 21 Nov 2024 11:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732215737; x=1732820537;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mhl4JBBgEDPMNbSymbtoH0R+ERhP+4wdK9miXYr5aak=;
        b=cFqSA8Pu4bX/bddxAjHczWSx2YowN2bmYs+i6EPr+svn4luXMg0aQKyZcBq7Dojq+1
         CsYiLFzdVxwzBOUkWcrgiWdI2/NsmKgtqAZVmjcx+xwxU1hovL6IBtj9ch+Fq8MhDttJ
         82cUx8yzO1IIg98GR4ZREupYj7ISqjwIq9ku3rSZvRK/1Nr2O6fBzs2LL5sA5y0A/xkc
         ng9Dx8dyW5a0x3nJ7kjUlowYZNfQsUVlKYGJWdkPISnaEe0cWoBO9cG5MVoqB2nIdi+e
         JiBuBGFfcivS9YUAHtX7tqCVEd+KXG6QDHkB/JAGslNZlChYahUFSZbBuTVdtn2iEjKS
         bj7g==
X-Gm-Message-State: AOJu0Ywqk15Ul9GL1zEIYfpkiZthuY5xRak084Ma5NDzM15fjThxG2ws
	9Pz7Bzxdc+8QfaiJrPndv98J0nAxZJsSEIM0yN3LkzPI41ezaIDybPDlNQa6MtpBWexf//JNt/d
	F++276XHEtWLuz3ZsfsLOrlIwWnrAKXzgQJtMyP2+m7Of+4+DRPMf+0DmnYNvC/8JPfVVyBhaOg
	vIWHHMRvuHsAJrFxEDUl2e9DHMGBchN22uMQ==
X-Gm-Gg: ASbGncu/VJGxAswBPq+M13rwp4/ZEhFBRmyE9OTqYo5T7aQjOsEOymWkESMrzgXMmyp
	Jr98gabnQO2rG3VaOJCYJyiib88pmVQBi9Mb/vSsF7Z1o0926ETRkE4kwLUiUErmQ9Bq/gJAdzN
	rKjaJE092sllK2od5SkoJzILTle7eMy9xcE5xFgbpAZVJ9fp34HZpJOsa0eQ2Rhy83OwwEXDPjn
	HgDeBvuKlYsto+ELOJlfMtfdQVckQVrnq6oqhcfG5yN0RwTnROauYUxmDYNlOH9H/OM27ZnzstP
	5hY=
X-Received: by 2002:a05:651c:50b:b0:2ff:58e5:2adc with SMTP id 38308e7fff4ca-2ff8db6631dmr47035181fa.1.1732215737130;
        Thu, 21 Nov 2024 11:02:17 -0800 (PST)
X-Received: by 2002:a05:651c:50b:b0:2ff:58e5:2adc with SMTP id 38308e7fff4ca-2ff8db6631dmr47034371fa.1.1732215736488;
        Thu, 21 Nov 2024 11:02:16 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3a3451sm85455a12.4.2024.11.21.11.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 11:02:16 -0800 (PST)
Message-ID: <8b027418-6555-40c5-a9e3-5fd0d66ef399@redhat.com>
Date: Thu, 21 Nov 2024 20:02:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/39] tests/functional: enable debug logging for
 QEMUMachine
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-12-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LPXKc03wnrGC6Xh99QRMeX8130oE47e0M5L10zDXER4_1732215737
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jLNT/e9s1nzX

On 21/11/2024 17.57, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Set the 'qemu.machine' logger to 'DEBUG' level, to ensure we see log
> messages related to the QEMUMachine class. Most importantly this
> ensures we capture the full QEMU command line args for instances we
> spawn.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20241121154218.1423005-12-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/qemu_test/testcase.py | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
> index f9c9de1166..e2a329c3e5 100644
> --- a/tests/functional/qemu_test/testcase.py
> +++ b/tests/functional/qemu_test/testcase.py
> @@ -57,9 +57,15 @@ def setUp(self, bin_prefix):
>           self._log_fh.setFormatter(fileFormatter)
>           self.log.addHandler(self._log_fh)
>   
> +        # Capture QEMUMachine logging
> +        self.machinelog = logging.getLogger('qemu.machine')
> +        self.machinelog.setLevel(logging.DEBUG)
> +        self.machinelog.addHandler(self._log_fh)
> +
>       def tearDown(self):
>           if "QEMU_TEST_KEEP_SCRATCH" not in os.environ:
>               shutil.rmtree(self.workdir)
> +        self.machinelog.removeHandler(self._log_fh)
>           self.log.removeHandler(self._log_fh)
>   
>       def main():


Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
