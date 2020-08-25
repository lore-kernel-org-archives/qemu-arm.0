Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3331676lfy;
        Tue, 25 Aug 2020 04:06:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg+4N/HD+ffPB6ZMus6PrkQkDLakAZCpaou/bz/oj+x5hC5RdDoOJbIQBEPHH+CT/0vjwR
X-Received: by 2002:a25:a085:: with SMTP id y5mr13821833ybh.410.1598353578288;
        Tue, 25 Aug 2020 04:06:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598353578; cv=none;
        d=google.com; s=arc-20160816;
        b=yMn5iwf+XWUTkzz+cO/4sPUrSLeqADw7SDUxzoM/TGs0IAAy50iW4eG2dTJQOKXmCx
         BVh4LcAysKtBOh6MxgUALgXzuvdLDlfpd0BLzSD5eB44HqNH8T53SXLvh90YqOkrhrr/
         uUiSCIRbFtaK2trKQ+pZiBr2cggSCmjrnZBq3uMq0T7zhn4tsigBl0Upbwxf7NOUZxnj
         dyZeOJ2+kE2sofff9TjcM2Quj8wMefaIXJvkaG8DMNkRb04RwBJIm72Hv48cyj6ESaBK
         HsWmtawapfLSEEAaIurDrE36wLP3mMipYDV3LsKV70dpdBr0RgHYshYQo9Y2Pra7KFq+
         OztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=j9Y/h/kbO07xVkwpCOZ1RXiTHjTAlx+NKGH/rl1lwcQ=;
        b=EZkErI2BV2GMcVh976qlyFxIsA4fWcIA3dIHNADd119LoFew/Gs4lLcDKofFYZRu1E
         hnO4IQHBULzQVGOfv6IYNn3rdMzxYjp0fdaprvxtiu4p/3cY1aJBb7s9DikvDSkDlHRP
         q3YuNBq1x3vYM3uf56i1FXfhOIoaFwfeglnj8m3SLMgp0k39iE+tvK3jyvNhNvzxEEVi
         fY9B0XOIqTSKyUR9DaiW29LKXk3DOONZpzqJ6lUDgSt3FEUkuo8JGfnYnqeeBMt6le/W
         V8zEfhgAPBjCBYxAfpBiRxURIgHwcJfo+TM5MmskA+x5++gWWaeNPv4reuYKI38/orgo
         IrQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eboDMIXW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si15365154ybh.9.2020.08.25.04.06.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 04:06:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eboDMIXW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAWmP-00034U-Kw
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 07:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWlb-0002Xs-Q3
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 07:05:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47699
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWlX-0003LW-Om
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 07:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598353522;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9Y/h/kbO07xVkwpCOZ1RXiTHjTAlx+NKGH/rl1lwcQ=;
 b=eboDMIXWHa8YbdL416t1UAk6ElDv04cv+cDM+Omda6ziwv2j2J1mjdy3442w8AVzIZM3I6
 cLoCJAHoLKOIKAKJpAKJy3+W3DWLK6LBLSmkx1Lfgoq3aieqognOr9yjf1tpc7QpqDRXUI
 m1GZvfdQ/c3RA7DjE5kL5UYivtNodEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-7JJ-n5nsPnq8UC2OP4u7qA-1; Tue, 25 Aug 2020 07:05:21 -0400
X-MC-Unique: 7JJ-n5nsPnq8UC2OP4u7qA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E11DB81F021;
 Tue, 25 Aug 2020 11:05:19 +0000 (UTC)
Received: from redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72CAF21E79;
 Tue, 25 Aug 2020 11:05:18 +0000 (UTC)
Date: Tue, 25 Aug 2020 12:05:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 04/58] pl110: Rename pl110_version enum values
Message-ID: <20200825110515.GL107278@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-5-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200820001236.1284548-5-ehabkost@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:37:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /TriebCusSRu

On Wed, Aug 19, 2020 at 08:11:42PM -0400, Eduardo Habkost wrote:
> The PL110 enum value name will conflict with the PL110 type cast
> checker, when we replace the existing macro with an inline
> function.  Add a VERSION_ prefix to all pl110_version enum
> values, to avoid conflicts.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * Fixed typo on commit message
> * Rename all enum values to VERSION_* (Philippe Mathieu-Daudé)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

