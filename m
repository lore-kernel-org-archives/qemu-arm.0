Received: by 10.80.163.71 with SMTP id 65csp155314edn;
        Fri, 30 Sep 2016 04:04:15 -0700 (PDT)
X-Received: by 10.55.143.134 with SMTP id r128mr6362941qkd.161.1475233455572;
        Fri, 30 Sep 2016 04:04:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z18si3595761qkg.204.2016.09.30.04.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Sep 2016 04:04:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpvby-0004rv-CQ
	for alex.bennee@linaro.org; Fri, 30 Sep 2016 07:04:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bpvNV-00084g-4Q
	for qemu-devel@nongnu.org; Fri, 30 Sep 2016 06:49:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bpvNQ-0006qu-Ti
	for qemu-devel@nongnu.org; Fri, 30 Sep 2016 06:49:16 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:36848)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1bpvNQ-0006qc-Mp; Fri, 30 Sep 2016 06:49:12 -0400
Received: by mail-wm0-x242.google.com with SMTP id b184so2859144wma.3;
	Fri, 30 Sep 2016 03:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Y0VBJtCO159G+r324b7N8WZYpbwmi4leWQjo2rwKtVM=;
	b=GSKk3pHLZJzS7HM26D/HalhaqGeMj2k7XxO9N+6nSLoRuBUxXhxbuTiOm//fzlWP45
	Glr77Yr2Qr9RcZyocHcXhuwya0IRlwlWg2w5sgOaO+ofZRWBlqMzLcOoSe2d2UCm4oJH
	FntklqM3q5FCNHERPG6k9dwybMj+ybTEcLAvAj4ENjuotx1UpB0Ionaxy7r83639/37x
	m+Dal4TpWpZZS55f1r8Cv8+5jEVt4pUipPn52RYfxdVKhY4FBc8ce06WIx3rT6GwhAw2
	BzfvstowjUk0aSWT/VP8N+ba1B+vV6SrAgkGo1F9276TbXmlExwH8ZTLz98pnNAh/u/i
	xd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Y0VBJtCO159G+r324b7N8WZYpbwmi4leWQjo2rwKtVM=;
	b=dIWfMqSbooeV6cjG+IQ54M8U0VZV9dI9L6H0I/ajlFryUFOlkdkx/AoR5E84lEI8hd
	+xD3hZrGgkoKRRPBr5fVIL+y1BzGrLUtWWCme+oSdagtoB0eWy/WXzKCRh2RUa+1Xx5Y
	+dyianYzQFTuTDHnw556pmlK8vYj47/hRls2Wgq7VHUTZ5NueJ2jc0qIwyY9lamaaxNX
	2YJHTuIOpET5FpVra6a1gTMWDjm6FNeOyGKU5IS+kzGSWSrCjYbXMGbZnSfDA2f8iT3X
	RSxe54uRCNGSS0QCAYoJoK97sI+e+kvHRIKh39+xUksQzfq7sdZHxv1p1/hGdkQl6hsu
	LD5A==
X-Gm-Message-State: AA6/9RmWJ/tudFlNwIq8WhouHMGt8KsuwL5v1JvjIDXkA2YCWmA3wVtPHyw43ugUqL/F+Q==
X-Received: by 10.28.181.145 with SMTP id e139mr3064773wmf.114.1475232551934; 
	Fri, 30 Sep 2016 03:49:11 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	s9sm18921807wjh.16.2016.09.30.03.49.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Sep 2016 03:49:10 -0700 (PDT)
Date: Fri, 30 Sep 2016 12:49:09 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20160930104909.GD9606@toto>
References: <1475230780-8669-1-git-send-email-edgar.iglesias@gmail.com>
	<4496a78f-e527-fae4-0bc5-a9f1c0d5c997@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4496a78f-e527-fae4-0bc5-a9f1c0d5c997@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix decoding of
 iss_sf in disas_ld_lit
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iP+0DrmASD/D

On Fri, Sep 30, 2016 at 12:42:27PM +0200, Thomas Huth wrote:
> On 30.09.2016 12:19, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> > 
> > Fix the decoding of iss_sf in disas_ld_lit.
> > The SF (Sixty-Four) field in the ISS (Instruction Specific Syndrome)
> > is a bit that specifies the width of the register that the
> > instruction loads to.
> > 
> > If cleared it specifies 32 bits.
> > If set it specifies 64 bits.
> > 
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target-arm/translate-a64.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> > index ddf52f5..eae25c3 100644
> > --- a/target-arm/translate-a64.c
> > +++ b/target-arm/translate-a64.c
> > @@ -2025,7 +2025,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
> >          do_fp_ld(s, rt, tcg_addr, size);
> >      } else {
> >          /* Only unsigned 32bit loads target 32bit registers.  */
> > -        bool iss_sf = opc == 0 ? 32 : 64;
> > +        bool iss_sf = opc == 0 ? false : true;
> 
> You could simplify that to:
> 
> 	bool iss_sf = !(opc == 0);

I don't really see how that is simpler/clearer.

I considered:
bool iss_sf = opc != 0;

but felt the expanded one was clearer in particular as a patch for review.

In any case, I have no strong opinion on the syntax.

Cheers,
Edgar
