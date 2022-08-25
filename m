Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp482532ejh;
        Thu, 25 Aug 2022 15:56:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6IthlEb5BVfM1bVPuUlav0M3TLZgeiGEx55c7E4tkWINgyjS1Wznw4wtZ85bIQ07JK0IYD
X-Received: by 2002:a05:6214:2345:b0:473:a82c:34eb with SMTP id hu5-20020a056214234500b00473a82c34ebmr5737205qvb.9.1661468191234;
        Thu, 25 Aug 2022 15:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661468191; cv=none;
        d=google.com; s=arc-20160816;
        b=VkKMWkQKpxCEEcjfI29iNkhbi3ZT9FRSMRux3qw929vAX7UfaV1klcZna6OGrpEs+F
         NQ9TdLwMJ3+5t6D8qiWL9B1dm3dw9U/yw/ZqNToSoRIH5JbUIw7MgoZ8/eJWPMTO6v8k
         cOv5jljEsp2TygOx7lEtORxmVBlcuoimZqLkSM98tca9uBfr9jB1kxgkP8s2HGZI+Suf
         xxvMgdTNhyIbxCKMqUpcf4DiYj9EInlmQmgQpcd3exMUtXohm5DvP50rM/zML/HJ67Zi
         BtedYlyEnR7zwMriecyQEIn2kVlA7NSuIXMdntXVCMl0fFNKZY2t1Wt72KsPqUAigSCG
         Zl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:organization
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=34QUsbjWUhkfrIZskbLaPt6GUfEKjLFfT5ft17PChjU=;
        b=v7bqvpxsvDF0Nyk5O1s/I233uf4D4/A5PtrzAZgA4FGoxarDrRArVpeI4meZDN2Fl0
         R+S/pmis0zFL33GTLrsgJZSH9zD8ts0PqFsQCmuIYECjt/GO5yslYapQzcSdjNP/dO/w
         PJnateBJXimvazPnARubumJss9OQ7uozOqwGUv6EcwCtzFKaxruNtTsCP+4zKxewPcFN
         SKKYtsnnCiqJWwdFl9FiPem3k04Y9ZWHj7LZmXNjMuWK5Hql4OzfzGdpon7/000mb+i9
         TzUjTunVzRFbb3m1cuY1SykRcYLR8He7AH6MJmVuMbxPdo2J3I7jG5VUuJqFCe8vKk0p
         3kgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=Hq4H1HWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020ac80785000000b00342f89838easi148876qth.169.2022.08.25.15.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Aug 2022 15:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=Hq4H1HWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gnu.org
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oRLm2-0005bp-OY
	for alex.bennee@linaro.org; Thu, 25 Aug 2022 18:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRLll-0005Y4-OH; Thu, 25 Aug 2022 18:56:13 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:48270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRLlk-0000gS-Tc; Thu, 25 Aug 2022 18:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=34QUsbjWUhkfrIZskbLaPt6GUfEKjLFfT5ft17PChjU=; b=Hq4H1HWx8XWnWCk/jQYu
 HdRvGX7tZon2Wap709DUC4yu6XOMDUd0FouVGmasS1CylcE5wsWjUzRr4olpPX4BaxQ3fF1B6ZcPz
 oBdg9TUVYisZvFxmlS0c3kcbAHVaGxojgFhgMwQo8GjWYCyhr51wMZMq0z3Ndf00oZ6TrHVUUnBHt
 DVASnbkSQ8ifIh5YPWlWsiIUyy+BXORUYwHJp3PUc3ze5Uefeirns6CnN70HVc1GrnTB8CCdu+tUt
 luD3a5XCOAlLFrQb5sOM+NEKQ1AX7nMbz+uBajxiBpbN43IT0duoewB3OqnbKBTzO8b2qw0eajymW
 pClyGkphmQqHBQ==;
Received: from [2a01:cb19:956:1b00:de41:a9ff:fe47:ec49] (port=58582 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1oRLlk-0004UD-Mh; Thu, 25 Aug 2022 18:56:12 -0400
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@gnu.org>) id 1oRLlj-002l1E-00;
 Fri, 26 Aug 2022 00:56:11 +0200
Date: Fri, 26 Aug 2022 00:56:10 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org,
 garnermic@fb.com, patrick@stwcx.xyz, zhdaniel@fb.com
Subject: Re: slirp: Can I get IPv6-only DHCP working?
Message-ID: <20220825225610.oio5h5bflp4gmaph@begin>
References: <Ywf5/cIDTV8OQ/0d@pdel-fedora-MJ0HJWH9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ywf5/cIDTV8OQ/0d@pdel-fedora-MJ0HJWH9>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
X-TUID: 35wuJkZiSeB2

Hello,

Peter Delevoryas, le jeu. 25 août 2022 15:38:53 -0700, a ecrit:
> It seems like there's support for an IPv6 dns proxy, and there's literally a
> file called "dhcpv6.c" in slirp, but it has a comment saying it only supports
> whatever is necessary for TFTP network boot I guess.

For which DNS support is welcome :)

> Maybe there's no support then?

It seems there is:

    if (ri.want_dns) {
        *resp++ = OPTION_DNS_SERVERS >> 8; /* option-code high byte */
        *resp++ = OPTION_DNS_SERVERS; /* option-code low byte */
        *resp++ = 0; /* option-len high byte */
        *resp++ = 16; /* option-len low byte */
        memcpy(resp, &slirp->vnameserver_addr6, 16);
        resp += 16;
    }

Samuel
