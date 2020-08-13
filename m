Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp802474lfy;
        Thu, 13 Aug 2020 12:07:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOFjoJNPZDQ1a5QlAefwAuU6EN/2YDam53clGIeUgILdLBmrT1WHaB4BJGS8q3aQTZWgiC
X-Received: by 2002:a25:e644:: with SMTP id d65mr9215997ybh.452.1597345675679;
        Thu, 13 Aug 2020 12:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597345675; cv=none;
        d=google.com; s=arc-20160816;
        b=SF6g/4Q3/7Czn5msxVPpQWdS3knQZeWju62xQmfhXqdMKy9WWv4RJKBGMP2UHZv2ZB
         QGbsNzzZjoJOYjB63o/vTmME/vnHZejWAjo0jbEyZ/WIhAvx14wllgAjrep/ebzkhK/P
         Qe9j+dBCT/qmfftCo7sj507BTR18GUyFrPk6merHjMFMBwhfFn3hJ2fNMLrs1r+QdXmu
         MFxKTmS2tUYJHKYVOb644gvNolksAVCvKvvaVb9FObhSH40XBJ8Q31EjW6I0Vz7khGrK
         9brBxuZEXYv57fL8aQvLjSGl+VRte/ovdmZU+QqX4SIRSPWEWr9yD3mEzuoXmvlL0QeE
         J0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=wIdHwM4GQus7FW0Q9der1IBWqhubCenOY7nipuivsfI=;
        b=AN1phyTHwuE1CmgKvGjW4Vaq3KZbFxvPSTp7kiLbPpZi2rPJzxwMaF/dgR9c0z9dnO
         3AD4jtk2jymUkFYhRS++xP5KyS2u0s0iVCXVPoxjk9fwA697YGlXf+KnGIHsX0vfwIw2
         HJ7OhAcefDate0ouLWKy30Xxbien8Gu5kp7PVKEKlxyfRbjadjX366XWnOzTC/B4NCqd
         ba14INODxAw9cRxWDZbRoD+A5lJbE8NREXuM+e9n7EEalI9aJmik/jk17NczacA4O4LF
         JBtW0DMMaSQF1UQyh6VNvoGxD60qGJl2ZuQonQongawjgbJX8z8Xbv/SVaNgY1Qq45/y
         aIVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hf1mGbaz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si5926949ybq.362.2020.08.13.12.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 12:07:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hf1mGbaz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6IZv-00079A-1X
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 15:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k6IZn-00078x-H5
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 15:07:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23680
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k6IZl-0004oj-56
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 15:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597345663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=wIdHwM4GQus7FW0Q9der1IBWqhubCenOY7nipuivsfI=;
 b=Hf1mGbaz/6x33BveAPkHNf/nlmfXcwgtUdkWcz9FyQ1KSbEpu2GXiJH2g0G4/PvEtce1zR
 MRqjOyZQxf87b9n6/wlrdo38pZhIwiC/T91PyvakA5jUlXlZR5UZEMayNFf5fflKm2y5Sx
 iEiLNGmEsle6QKcnTwHYisSBuYQ+8ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-5ANmcTXmMPi5CRifDp66Ig-1; Thu, 13 Aug 2020 15:07:41 -0400
X-MC-Unique: 5ANmcTXmMPi5CRifDp66Ig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 323D3800D53;
 Thu, 13 Aug 2020 19:07:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-8.ams2.redhat.com [10.36.112.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 392B06FDB3;
 Thu, 13 Aug 2020 19:07:28 +0000 (UTC)
Subject: Re: [PULL 3/3] configure: Allow to build tools without pixman
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200724164258.24886-1-kraxel@redhat.com>
 <20200724164258.24886-4-kraxel@redhat.com>
 <f1fbe9b9-575e-b55f-8596-754a82654b5c@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2abe330a-37e2-fda6-d531-79fb5805afc7@redhat.com>
Date: Thu, 13 Aug 2020 21:07:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f1fbe9b9-575e-b55f-8596-754a82654b5c@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:45:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Rafael Kitover <rkitover@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DiEZx5C6qJcG

On 12/08/2020 18.26, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 7/24/20 6:42 PM, Gerd Hoffmann wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> If pixman is not installed, it is currently not possible to run:
>>
>>  .../configure  --disable-system --enable-tools
>>
>> Seems like there was a dependency from one of the required source
>> files to pixman in the past, but since commit 1ac0206b2ae1ffaeec56
>> ("qemu-timer.c: Trim list of included headers"), this dependency
>> should be gone. Thus allow to compile the tools without pixman now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> Message-id: 20200723141123.14765-1-thuth@redhat.com
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  configure | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index 4bd80ed507aa..2acc4d1465f8 100755
>> --- a/configure
>> +++ b/configure
>> @@ -4065,7 +4065,7 @@ fi
>>  ##########################################
>>  # pixman support probe
>>  
>> -if test "$want_tools" = "no" && test "$softmmu" = "no"; then
>> +if test "$softmmu" = "no"; then
>>    pixman_cflags=
>>    pixman_libs=
>>  elif $pkg_config --atleast-version=0.21.8 pixman-1 > /dev/null 2>&1; then
>>
> 
> This commit broke my '--disable-system --disable-user --enable-tools' build:
> 
> $ make vhost-user-gpu

Yes, there is already a patch on the list to fix this. Look for:
"configure: Require pixman for vhost-user-gpu". I hope Gerd can pick it
up for his next pull request.

 Thomas

