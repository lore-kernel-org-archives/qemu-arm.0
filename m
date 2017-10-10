Received: by 10.223.197.9 with SMTP id q9csp26461wrf;
        Tue, 10 Oct 2017 16:09:09 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDzfMJgax1rYCenEOU103w63MONKX8hyoCPT2qGy/bdHrYKoH7nBKGirkhFo5vVXNTf0NYk
X-Received: by 10.200.25.112 with SMTP id g45mr21034184qtk.40.1507676949500;
        Tue, 10 Oct 2017 16:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507676949; cv=none;
        d=google.com; s=arc-20160816;
        b=diA/Z1WBIcwbdBOaUkkhLAQ8wFQ6HfBGiWN3VyDHyEAdIU59QNJB1O11P765+BoCgf
         bk25llykF8G8W5e3KCCeDlpt+DgK9dOC1W529QsNjSZsi0gFFN05h/8peA3YgupKxwjZ
         Qve3hvWL16r60eCY4Q+mPDNQkbiDvF0XnTpUOddxuz6paVVPb3mCkSqhqAss8alR+PRV
         VokAc3YqwXJI075lqtwkM7iPPvoONC2GiYAYrz8GVptNhhKslnutV7hsGk2Cy8pk+d4k
         AuIcuv97WLNUhnuKlIQ0Zlwh1ipoGcSsTW7CyoO3oAYs7p0e5FwtpJlQVtBMjIRQ+cJF
         q6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:arc-authentication-results;
        bh=5osw5rFGmBrXzhA6hWVdcim4MkQl+rRYAL8bSL7vwMw=;
        b=a469NM0vZpVRCTZi/+BaV/PAxFQODNv17QmFuc+NeVDtW5gLiThf6dKeE3iOkqx9UK
         +Bx3iH5O2GcIStIVKRS3O6i+TrU6Rbz753jQUMgF8oL/zT+P6UfjPAbe73cPXvdYugWq
         UBnbVH8ajxrwFfkpFFgZlxKlVe8mGfMN0OkIhFB+2atCkAfWVGJDnZofVa4FZab7Tq0a
         QE43gQTo2D59Aboo6yvgNYHGXFw7HM0jngpaFqB0z2ym+Y28hPANK79wsS3B4e8gDAzD
         gpaX0k+5J8sZ72x/ou0DMZUiEHFoLx6yfQJANhtJoHbCkCJA+NSVceLtF7FuGdbwI8rg
         Jcgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m128si2444179qkf.173.2017.10.10.16.09.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 16:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e23e7-0001Dh-7j
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 19:09:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=449813866=anthony.perard@citrix.com>)
	id 1e23cf-0000Z8-HM
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 19:07:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=449813866=anthony.perard@citrix.com>)
	id 1e23ce-0003L7-Mz
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 19:07:37 -0400
Received: from smtp.citrix.com ([66.165.176.89]:55999)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <prvs=449813866=anthony.perard@citrix.com>)
	id 1e23cZ-0003Iy-16; Tue, 10 Oct 2017 19:07:31 -0400
X-IronPort-AV: E=Sophos;i="5.43,359,1503360000"; d="scan'208";a="445261580"
Date: Tue, 10 Oct 2017 16:37:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20171010153710.GL1771@perard.uk.xensource.com>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170922154014.29350-6-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Subject: Re: [Qemu-devel] [PATCH 05/34] misc: remove duplicated includes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Stafford Horne <shorne@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UYLT3USfa+Ax

On Fri, Sep 22, 2017 at 12:39:45PM -0300, Philippe Mathieu-Daudé wrote:
> exec: housekeeping (funny since 02d0e095031)
> 
> applied using ./scripts/clean-includes
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  accel/tcg/translate-all.c          | 1 -
>  exec.c                             | 3 ---
>  hw/arm/spitz.c                     | 1 -
>  hw/char/xen_console.c              | 1 -
>  hw/core/machine.c                  | 1 -
>  hw/s390x/css.c                     | 1 -
>  target/openrisc/exception_helper.c | 1 -
>  tests/vhost-user-test.c            | 1 -
>  util/qemu-sockets.c                | 1 -
>  vl.c                               | 1 -
>  10 files changed, 12 deletions(-)
> 

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD
