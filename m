Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp799815ejb;
        Fri, 17 Mar 2023 05:08:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set/j/n9aSW4i3mPQQkeixOn2U4PfYUDeolcUmgRh0SV9EGe6PleX3blJfPNRv5j03dL4AT3w
X-Received: by 2002:a05:6214:19ce:b0:5ab:af50:eb34 with SMTP id j14-20020a05621419ce00b005abaf50eb34mr24847058qvc.12.1679054916935;
        Fri, 17 Mar 2023 05:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679054916; cv=none;
        d=google.com; s=arc-20160816;
        b=fW4XRt1gmJ+r8tFnU1BhY0mtW7IwSOHF+cgvpR8+AtKBNEw61F4hU+hA+ZtqkaAPDS
         UUnE0YfQDlcfx/LxhFSbKIIhANwbcXdBnEneLnWtbRBESNBtYGhj04iMKWH0ehP4R0Zs
         Mo70+cQRdG4dYczsZT66rMFTDhOmeTqjYujq4r2IrhQY95IAZCTFBIKuYstPFr2MjVY6
         tH8QbjBmmlA2Z4Vd7dGHBmoErzrRmraNGUg2ZfqSwjmzyPQGb/3N+Ols3Rd1g0PS5AfU
         CMB14Kdei10txUMfh4OC9lM0s1uuOccgd69KtUlzNwKAO06ivudHlDNT9RjGtlZMl5Vy
         ZY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kScjxjWF3/DNY8MH6JIoXktFOWCux+jIyciHRIIYQeY=;
        b=TnrYtSTq+gwmLnhBNS5A0Q3LzLHzlEv6oa9/bKVajUkRzjNq5Tex9bnNMy39WoYs4O
         B+y6q9yg78l4BcvwsPcb5LznsKBgHUC7YPWOps5IOqwuqJanPBhxBU/i7EuR7XWeSqOK
         T7JS+6YVigBrDAn1m00CsVvvW9VfgM1kImH1LTyuh85w3wML+04s1M2bcPG+w0GenhRh
         s6C0s8Z7MectoYlNfLLLqMusaIZa19Sosm9dRoss5YopTbezOQ8rzgR6SSOqRL+XJDz4
         sv+svcbJmAPYudJPv3QgYhXb4xOfCOggdihBKZ2V0h9J5KHlXVlCicIYX4ocHR7ohE6O
         8/8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IRZnhxZ4;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bs38-20020a05620a472600b007427e96134bsi881634qkb.751.2023.03.17.05.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 05:08:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IRZnhxZ4;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679054916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kScjxjWF3/DNY8MH6JIoXktFOWCux+jIyciHRIIYQeY=;
	b=IRZnhxZ4agnw63io9mqVbJoAkLtSlQQcuY5xjKUZZ6i2/zD3RIDrjHifbylHCMpDpmQcax
	/tkB5SewZRTnbpsQvwEw/0N/Beq/Qar6CLeeVeoH8JJc+jJks0z0jxqidbFYZxJiSp2WNL
	TbnlRvIpm1C4w2Dfx1AXKdyw4l/9/Z4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-6uBbwH4HMpmB7AuYQJAGxg-1; Fri, 17 Mar 2023 08:08:35 -0400
X-MC-Unique: 6uBbwH4HMpmB7AuYQJAGxg-1
Received: by mail-wm1-f72.google.com with SMTP id k41-20020a05600c1ca900b003ed383b1b62so1776630wms.8
        for <alex.bennee@linaro.org>; Fri, 17 Mar 2023 05:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679054914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kScjxjWF3/DNY8MH6JIoXktFOWCux+jIyciHRIIYQeY=;
        b=SrWuERT0VcSdBxC2ZQSgwuGI3Rk8Obaf/UHQ/e/4I4EfSDc9xCBoGduTtTu9YtT0V3
         0uf9szCcjulxoMpGQNI/Qqg9tGzLcLBxFfwty/1A5nFY9BKJGy5mhWrwnyTkFxBhHHK7
         ciPMnduggJwmLo7+SY0s6IS8Ou5bXJ5rMCSnh1mq1eD38Ra68l8h9OF8FLlQG/CdZR8v
         7B+ychNLBplG178p1UwiJ/f/p7nzXe1dBGQ1rSbtZLIc9tLGXcGTsTKTB5aRY2Ba8TzF
         GL6KOOm7Mqje/SO8Ydh+6eH9GQPKGwVMMqNOSxVlJrjPinohzEi008aNvkx92da5U72P
         KoXA==
X-Gm-Message-State: AO0yUKUerKBDrIyh5jsU1EGF3Q1mQcbQEl5rxYVaum7JjvL/8SIkjdhG
	oINy8IlaqPIydCWBYXVuS8y8154VF1XOpNh8aTGWWauULVdk1drzWNuuVd6Yb7JSA5RRm6g6sFP
	f1644+1Mx5b+9gSz91tRsDO1WNIQIa+b8KKADewJ4Zmu62HKipJGXj5FtyAerJdjxIzBtam3KY1
	5mJQ==
X-Received: by 2002:adf:f150:0:b0:2c9:70a4:4f94 with SMTP id y16-20020adff150000000b002c970a44f94mr7656740wro.18.1679054914336;
        Fri, 17 Mar 2023 05:08:34 -0700 (PDT)
X-Received: by 2002:adf:f150:0:b0:2c9:70a4:4f94 with SMTP id y16-20020adff150000000b002c970a44f94mr7656656wro.18.1679054913951;
        Fri, 17 Mar 2023 05:08:33 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de. [109.43.176.33])
        by smtp.gmail.com with ESMTPSA id j20-20020a5d6e54000000b002cea8664304sm1791406wrz.91.2023.03.17.05.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:08:33 -0700 (PDT)
Message-ID: <162c7939-abed-bdb5-47bb-e7b9e873f6b6@redhat.com>
Date: Fri, 17 Mar 2023 13:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 07/32] tests/tcg: add some help output for running
 individual tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-8-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sTkbOdj8m/rC

On 15/03/2023 18.43, Alex Bennée wrote:
> So you can do:
> 
>    cd tests/tcg/aarch64-linux-user
>    make -f ../Makefile.target help
> 
> To see the list of tests. You can then run each one individually.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/Makefile.target | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index a3b0aaf8af..8318caf924 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -201,3 +201,10 @@ clean:
>   
>   distclean:
>   	rm -f config-cc.mak config-target.mak ../config-$(TARGET).mak
> +
> +.PHONY: help
> +help:
> +	@echo "TCG tests help $(TARGET_NAME)"
> +	@echo "Built with $(CC)"
> +	@echo "Available tests:"
> +	@$(foreach t,$(RUN_TESTS),echo "  $t";)

Reviewed-by: Thomas Huth <thuth@redhat.com>
