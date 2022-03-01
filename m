Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2338102lfq;
        Mon, 28 Feb 2022 20:59:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCArqHh5sYMcuSPwjYqlM1U9nTorz+0j5GBS4Nl+7cS99crJr16saUXZpAyy6CsBNbkNQP
X-Received: by 2002:a25:e30a:0:b0:625:3d53:91b7 with SMTP id z10-20020a25e30a000000b006253d5391b7mr18493908ybd.499.1646110762146;
        Mon, 28 Feb 2022 20:59:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646110762; cv=none;
        d=google.com; s=arc-20160816;
        b=gAX3OTKiXQ+QTnKtMtI8ha23IYEOPMZCnuKWgpeDN42GAiyt4fwHWjp8x9FaQnnwqq
         bhMRosTi0wgUW8hUdEzk0WCozfZwS14neU7VMOb3r48oJwvrcfrUTDwJwX2Vi5G1wv0Z
         vdKfW4/9cy/IBxjTnE84+fJQm7jvEOOhvpCl5RO0p0ohaLHKO2BaiV+eVbQyYqRORf76
         JxYZx1EWfmqS0/KjweWiIZQ25AeMgMny+ANP85I2pfytD5SHgtInAHKyL0u/2HrwLfc+
         /KX06uEecMdan4MqEFh80I1Wu89FYjCXG0ObA1d7Mqdmm0Wjm7o3ikgdXMI7CT24ceSV
         RDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :mime-version:message-id:subject:to:from:date:dkim-signature;
        bh=MnNhFIgMAn/jAADic9V1Aj+2bLQDoMvnVPOMDxBpfds=;
        b=qG5Zh3rG7MHF9dSjWHFZQ7zMODx6o8Gd/UBIXZf+xdJLkqYoi0kMSgZflHjaaHxyoV
         24HKYZb+lt+VenBn/OtmO3g7V7m9+heZgf4u8uqeMhiNzVVFFRPp9eBdRcYOR8mIt+NU
         mpd2ZfmNG16loBjyVLtsE37hnx/wWOfjQ/LKSug9FesTyDBAIrZVaDWE3j1I84I1D9l3
         smk4Wx/0I9zl7R1g7pdsjk+prIKWY7WbblJ1V+4FgNCNE1MgGzA3AoJy7Ux3eo7/4haN
         RD9gUO501j+pPbWugwOyvnp9cGRjIoiGGj25r2EIVfe0PFV6cg3yhJye+eBoL27Xo6x4
         XJ/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="dKs/d67B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d65-20020a25a347000000b006157cb9a8easi9977600ybi.648.2022.02.28.20.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Feb 2022 20:59:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="dKs/d67B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nOubZ-0007TS-FS
	for alex.bennee@linaro.org; Mon, 28 Feb 2022 23:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelo.schmitt1@gmail.com>)
 id 1nOsDM-0003Kd-L1; Mon, 28 Feb 2022 21:26:12 -0500
Received: from [2607:f8b0:4864:20::c35] (port=44556
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelo.schmitt1@gmail.com>)
 id 1nOsDL-0005vT-0a; Mon, 28 Feb 2022 21:26:12 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so21056998oot.11; 
 Mon, 28 Feb 2022 18:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=MnNhFIgMAn/jAADic9V1Aj+2bLQDoMvnVPOMDxBpfds=;
 b=dKs/d67B6u9aU4yHfNlHR6Hv3HEfyLPmaiRqJ+s8TBBbW4A0r9uWlxkLpU2VvtGWvw
 974yGwKZO7hADo0oVXU+XKynExo9vaFPi70L4a19oLgGm99B4BMUQtA0d5hwBbOXeYs2
 7aOtjnpXjTiLqAqbenaYbXDTjpe24cat+gbypa9OuMRGtWVHY+dGuQHXtiugCOY7wYx4
 w1hwLEgkJcXAG+5iviLZeSZkJcXkmEXl0KbtKQv2HfL41c/RAdpmvJSg2kbnOVaUZl/s
 jmkn/LISoMZd9FasKyO5GKH3AmgawhaBdfj8rkSLNwScbn7C0zKx1gyNHJ4elgQFh3fx
 WR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=MnNhFIgMAn/jAADic9V1Aj+2bLQDoMvnVPOMDxBpfds=;
 b=VTmnZeJvClzsePmn06m0HEoFNgzb99W6MZeijSVXo56hUjYfnNrr4zrYKsQPAcan6a
 nsz+AEA/GexRVO5qy21gxdxNVvgErYtXTHRavQWj1+TQlT+C0PWXiJZV2tMCtLPCAq6I
 jCuFf6XxUgyElFgUWAh9PeoebVHiJ1hswXBYW8aPcb8Mkm7qmWpKxpVzKZn03WXr/4Pv
 f0zpV3ozNSoBKBqmzS3oxFITH8PzxyxzQqq/c1a8biiHkc70Fqu709UKdkBPPz7ffNyY
 Q8+XbdXZXaigS01J7btSJNmdjbtWwGdLqzr2RUzLM1EwUZhZ5sdxCuiaakWvX7B9K6Au
 BlLg==
X-Gm-Message-State: AOAM533UuY67cpmRlSmcH+7uo5bIBNwziWvXDRACas3wbP1KglX5HLyz
 zQ9UZHnH/IjNDLaHSaSMe4NzrQSxwVY=
X-Received: by 2002:a4a:2a4e:0:b0:2c6:c823:e6b4 with SMTP id
 x14-20020a4a2a4e000000b002c6c823e6b4mr10717886oox.29.1646101568736; 
 Mon, 28 Feb 2022 18:26:08 -0800 (PST)
Received: from marsc.168.1.7 ([2804:30c:b7a:7b00:70e:e3d5:be94:991])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a056870d20700b000d1614be328sm5310656oac.27.2022.02.28.18.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 18:26:08 -0800 (PST)
Date: Mon, 28 Feb 2022 23:26:05 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: qemu-arm@nongnu.org
Subject: SPI support for the virt platform
Message-ID: <Yh2EPSvM0xLUYW45@marsc.168.1.7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=marcelo.schmitt1@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 23:59:08 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, theobf@usp.br
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VmGMtdYWe9vy

Hi,

I'd like to know the opinion of the QEMU community on some topics.

In 2021, a pair of patch sets for drivers of the Linux IIO subsystem was
proposed based on some QEMU hacks that added virtual devices with which
it was possible to test the proposed modifications to the Linux kernel
[1, 2, 3].

Most Linux IIO drivers connect to the system through either SPI or I2C.
So, it ends up that these buses are needed to do some tests on IIO
drivers. Because of that, those QEMU changes included hacks to the virt
platform to add SPI or I2C buses.

The documentation says that virt is a generic virtual platform [4]. In
this regard, adding more buses to virt could turn the platform into
something less generic. However, if support for SPI/I2C were added, then
it would reduce the effort needed to develop virtual devices to aid
driver testing. Before putting effort to develop something concrete, I'd
like to ask just to make sure:
Would SPI/I2C support be a good addition to QEMU virt?

Another possibility would be to add support for SPI and I2C buses on
Raspberry Pi boards emulation [5]. Would this be a better idea?

Also, the QEMU devices developed could be upstreamed. At first, I
thought that developing virtual devices would be a win-win situation in
which we could extend Linux's test coverage and add support for new QEMU
devices. However, as these would be dummy devices, I'm not sure how QEMU
would benefit from them. Anyhow, I'd appreciate it if anyone could give
a word about that.


Thanks,
Marcelo

[1] https://lore.kernel.org/linux-iio/20210314181511.531414-1-jic23@kernel.org/
[2] https://lore.kernel.org/linux-iio/20210614113507.897732-1-jic23@kernel.org/
[3] https://github.com/jic23/qemu
[4] https://qemu-project.gitlab.io/qemu/system/arm/virt.html
[5] https://qemu-project.gitlab.io/qemu/system/arm/raspi.html
