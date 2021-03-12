Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1045741lfg;
        Fri, 12 Mar 2021 01:11:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOhBhFi2C0VxMMPAp59DgqpAM0x7XzkUvC0KZdEW6xxMRI6ghMGoJf+9JCSbIaAlGQg9HU
X-Received: by 2002:a25:2206:: with SMTP id i6mr15688676ybi.351.1615540301577;
        Fri, 12 Mar 2021 01:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615540301; cv=none;
        d=google.com; s=arc-20160816;
        b=aSW2PNDt2P3G1+185fCdFUdiRtBf9rQZw5SYsV72KiLI8h5Y0wB6/z3r6SdezdTp6F
         G4lKmnS0DkEoESyGT437tx1Cy2j+rPTEaelui3a5WjLroCwQPkLxc5xZBkvZhOQc5KCz
         AwEqUX2VX7mWTld0g9M4Z+e0R2/0Arjms4+9HqtzmFTGDJVu0oRBMNRg7oN7cALrd7Qr
         LmVwnErdtfd/39tVewJKR9MwedKzSeGL4Q9Dv805e6kXao24es8e6O7kx25fCjrwnV11
         cPOp2zlT6lBuIKZBCxVS1V36in6az7Fas5yqiKb/E6BhS5oDK93rdf77ex0gQ1UCO1gf
         XxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OiBm9NEUVeB8/YnYDXgZaCnBIddAzE5H+i7j3Te2Hdc=;
        b=swzzhplu4+SsRnUuz26KBBtW+f86aXAD9vr5RPSxv+f6zCq24VUVx8ORPGtZbAjqcb
         xSgFrDOxaoyVh7LtX0c/z/tQJSGgOSGOIl3mUmPQyo5qUdUJXSlQjf8DPFPryTfYK0Lf
         y16rJjPO2iS9d2KXA2LA4DIJqkeNkyXwnaMr1rPW1CcN2Qcdcpb/Iq20b8uvhcbRH0w8
         VYG/keI4Ol4GkfVcUYK8GsI9UpuX3F6bBIJ5H+Pia+JsxE0oc+w8MJS3i1GxyWRxOtQ0
         FtkR3IvaAKCTkTsbjzy6mXe9rytEFhAWT2GbnbldVNb2EQjWKUGRgqYxu06oHKnXzncO
         Ifjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="EYppLv/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si5871951ybj.354.2021.03.12.01.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 01:11:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="EYppLv/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKdpc-0003XL-TB
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 04:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdky-0006St-0X
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:06:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdkv-00039y-Ct
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615540008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OiBm9NEUVeB8/YnYDXgZaCnBIddAzE5H+i7j3Te2Hdc=;
 b=EYppLv/id1CFkI52APtPpC/23Eglmf3S0dClSOSsPz8ZrIXoPHgHrSnU3phxGkev1e1aat
 qi6vc6e3Wzq3XlfM7u7Ne6NFb/Z387pFOlTBaGW3zggnw6OsnGnedkC1eTWNB+nQ2sPZc8
 TYLxh/dm1nLFViRcB4FQk+4lPQZ0tkA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-WFe44p-WN7aH0Y238gdcUg-1; Fri, 12 Mar 2021 04:06:46 -0500
X-MC-Unique: WFe44p-WN7aH0Y238gdcUg-1
Received: by mail-wr1-f69.google.com with SMTP id g2so10867139wrx.20
 for <qemu-arm@nongnu.org>; Fri, 12 Mar 2021 01:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OiBm9NEUVeB8/YnYDXgZaCnBIddAzE5H+i7j3Te2Hdc=;
 b=K2U2TpqiulMWaBBn39/rLSq3ImW+5hQ71Bsh3ANhqvAJNIdlrKKqYTsxGRu91IF1mt
 YHwAeX589V50NotYZ5QoPiLM/9f34WrBNBLZjF3/iFUwnZA85UNKs4bGe2iKylaamHWc
 eIpqc0jP4DFmAUs6JMM3Xn/yhVtuRYeAtu1r2aPGt71S1VxulpHSV9kc9Fo6u27ykzAM
 2WMrgzm9V2JFNw+3BVEHAe8Rt8fsV8vHcZ4mj6mrX1uGEwPWuk/an4+eZvyx5zdhcaSY
 TTdPY5ZU158D4WlTyysaUsMSKGixsxRItv87HS4rkWYitZKHEgp9RmKHpSGjXgiPL+45
 ffzg==
X-Gm-Message-State: AOAM530FUFTHMoPvu8uQvyIXVt91Hn9/PP3ENRJwUmh3UQiNapOt/iwJ
 hn9k01/W+vI26+vv6suuBe9aTvlGul/mxnwclHG2iNHvnoW6PONfQcNCXGSWycm+Gfmnx6/zCqa
 hgFNHVycKxqoi
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr12792629wrr.274.1615540005786; 
 Fri, 12 Mar 2021 01:06:45 -0800 (PST)
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr12792603wrr.274.1615540005613; 
 Fri, 12 Mar 2021 01:06:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id 12sm1403925wmw.43.2021.03.12.01.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:06:44 -0800 (PST)
Subject: Re: [PATCH 6/6] tests/qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-7-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <24b4b31c-8e38-edd0-567e-1ab7f9b1b56e@redhat.com>
Date: Fri, 12 Mar 2021 10:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210311231202.1536040-7-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o/DYNhtgRS7x

On 12/03/21 00:12, Philippe Mathieu-Daudé wrote:
> Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
> 32-bit Arm hosts") we can remove the comment / check added in
> commit ab6b6a77774 and directly run the bios-tables-test.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/qtest/meson.build | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 2688e1bfad7..405ae7a5602 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -170,14 +170,13 @@
>      'boot-serial-test',
>      'hexloader-test']
>   
> -# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>   qtests_aarch64 = \
> -  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \

I don't understand, has aarch64-on-ARM TCG been fixed?

Paolo

