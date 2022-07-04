Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3096877lft;
        Mon, 4 Jul 2022 02:57:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v72aG5SYyEOUFAd4PhM5/3+TpbKI5VcxVVO5AhA27+eLi/fxqv/uzHD9jUh5a3/Pgs5Lgd
X-Received: by 2002:a5b:a4f:0:b0:669:9661:55e4 with SMTP id z15-20020a5b0a4f000000b00669966155e4mr31159285ybq.466.1656928658361;
        Mon, 04 Jul 2022 02:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656928658; cv=none;
        d=google.com; s=arc-20160816;
        b=OLYsHzhrKvgTXvPGo+89zUbaT3raoVOSudvaSPfvDfiKlt155zZzen4Ch5hEQ5tHNo
         KuUee57ajZyu1/KuHJXS/PMzscuBir+rRUNa0db/WKZyzySQx8aZyLbEOxFnhuXVLyQ1
         0Q5ECvSkT+WXkviz90Fe3jEJ/Nk12D8DEJzUN3ZXHR/B/0MjaNQgYraUX+bAX/Teprca
         m5ngaPxzeNo8pn1KQXUQGzfQAUigi31H6k5rMgGIZLAxUmVi8pHrJ+TQZoQVUfICN8Pz
         lFq3klT+T+P1tWesJptJLd4pZDN0u8pESGusvvMLcsGAkekEpVNK6Tih20KRmY+zz8RO
         ayUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ekZPHMg/tXAWjPagKNk966F3hzwjo6JI4NFZ5pJ+Wc4=;
        b=S7Ty4Klw7BM5yrc4pEBexItm+ZZjweJx0jGl4093PhgufuDTvU0sU4Z9Nk/nWDz0dl
         iDLLASp8xkHEPXgVP12su3zfFPhvIbK6NLmO+Iro8fS4734zoLS5iDCsq4MCWVNuekxH
         mQpCGUpLfjJvglGMcIrPaBqHjO3rOpdWMrZY0LqytEp8CnlpNNGw6uyuzqj9e+1CU9Pm
         O3Q3upsgYrrFa7/9IE2G5PZD2F9eR+E68wojd8CfiQZyP81H6TSC/ETjl+i+h3HUSWW7
         w1iCpNYpEz70RCq/5GdXdg70xVgFyR/ETFbdYIaJDZjUWuQ06fjD7jjp23AUm+iffwPk
         OAFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AMT38nqu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k192-20020a813dc9000000b0031b66510702si38784535ywa.315.2022.07.04.02.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 02:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AMT38nqu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Ipl-000742-HG
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 05:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8IW7-0005Dc-Cv
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 05:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8IW4-0005VO-FO
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 05:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656927435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekZPHMg/tXAWjPagKNk966F3hzwjo6JI4NFZ5pJ+Wc4=;
 b=AMT38nqurKcyljzSZAuMviTHVJcSKQy+zMHTOMPKlYXxFJY0fR9DtxAFM2AGl0C5lRJUrG
 Mm/FmbKxRGi2fkg9L1xwBgGEorWzrNmuL5XIFkflo3h5omPgwrP+IkKAoCtSaQh6rR4Ana
 xNZVzHUflHiHHu3ck19MoM2aRPUYmaw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-hhbhgUZ_NL6AmQgAZ6vZKg-1; Mon, 04 Jul 2022 05:37:14 -0400
X-MC-Unique: hhbhgUZ_NL6AmQgAZ6vZKg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so3858502wmr.0
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 02:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=ekZPHMg/tXAWjPagKNk966F3hzwjo6JI4NFZ5pJ+Wc4=;
 b=bWk5n4Y70A8otjiZs48F+lnzRVJjFc6cR2e0kKhg5egz58PXcLm5IovgdnaNnia61W
 plKmLdVxR1Hmp5T/ZhDNTmiKxDyv1iO8wJe1ctPJEjNjZoST8O1+TWxWoxgOHUiqEwAU
 Tsjw63uoW0KtVu+31fBq1ATafuPsUi8SY4V3Z2WmLMq7e1ZxlMOPNiWBu9sdpaH94rYD
 eD41vTijifpdwwVVVYfNQiH8NA6k4yVRTFhK/0KOyYPXcq28P0QU7mRPlB3sRamUHamd
 qjD/R8TJUBS7yM35zdIYz0hCTRYcC79zXE78D7fDgEu+coOwycD5fRbT6goD5lh0AZ55
 Pwfw==
X-Gm-Message-State: AJIora9xoTDEOymBGY420AUaf8JZmMISbUhEdZMTotqJ3QAR95E6PnNO
 3WaXnjOLKlkaSIceAPeCWX2rUC2hT0mR4B5C0LSLIrLRH31CRvh2IYfMfeRW4tCIbjF57GMdXof
 x0GhNpf7KCt6v
X-Received: by 2002:a05:600c:1908:b0:3a0:998c:313d with SMTP id
 j8-20020a05600c190800b003a0998c313dmr30271250wmq.19.1656927433330; 
 Mon, 04 Jul 2022 02:37:13 -0700 (PDT)
X-Received: by 2002:a05:600c:1908:b0:3a0:998c:313d with SMTP id
 j8-20020a05600c190800b003a0998c313dmr30271210wmq.19.1656927433085; 
 Mon, 04 Jul 2022 02:37:13 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-243.web.vodafone.de.
 [109.43.178.243]) by smtp.gmail.com with ESMTPSA id
 u6-20020a5d5146000000b0020fcc655e4asm30291841wrt.5.2022.07.04.02.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 02:37:12 -0700 (PDT)
Message-ID: <aacf7432-6f0b-b8f7-bdc4-116e3873543c@redhat.com>
Date: Mon, 4 Jul 2022 11:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
 <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
 <YsKvalrPIO96wWuP@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] scripts/make-release: Do not include the edk2 sources
 in the tarball anymore
In-Reply-To: <YsKvalrPIO96wWuP@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IMSq2JJBfcqA

On 04/07/2022 11.14, Daniel P. Berrangé wrote:
> On Mon, Jul 04, 2022 at 08:26:34AM +0100, Stefan Hajnoczi wrote:
>> On Mon, 4 Jul 2022 at 07:45, Thomas Huth <thuth@redhat.com> wrote:
...
>>> +cat > sources.txt <<EOF
>>> +The edk2 sources can be downloaded from:
>>> +
>>> +https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
>>
>> Please use QEMU's edk2 mirror:
>> https://gitlab.com/qemu-project/edk2
>>
>> QEMU mirrors all dependencies so that even if upstream projects go
>> offline we can still rebuild all of QEMU from source.
> 
> Note that the github/lab generated tarballs are not signed, while
> QEMU's release tarballs are gpg signed, so from that POV this would
> be a regression no matter which site we point to.

Maybe we should point to the edk2 release page instead? I.e.:

  https://github.com/tianocore/edk2/releases

Anyway, it's IMHO certainly not *our* job to provide signed edk2 sources here.

> Also it would need more guidance on what to actually do with the
> tarball, as if you merely unpack it into this dir, it won't work
> as it will be one level of dirs nesting too deep for QEMU's
> build scripts to work.

I could add some wording how to use the edk2-build.sh script with a 
downloaded edk2 tarball if that helps ... not sure whether it is really 
required, though, we also don't provide instruction for building any other 
firmware yet, as far as I know.

  Thomas

