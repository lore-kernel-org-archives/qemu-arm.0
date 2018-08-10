Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3005404wru;
        Fri, 10 Aug 2018 05:21:35 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPy+UddPSStZEuKo6ikOakFBNfiEwNEC94qT/4IgnEyulg5Wo9UjwxzuX33i/5fQ1eGlYRmM
X-Received: by 2002:a37:9185:: with SMTP id t127-v6mr5611573qkd.182.1533903695596;
        Fri, 10 Aug 2018 05:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533903695; cv=none;
        d=google.com; s=arc-20160816;
        b=SquwyjT3ngOXAiqeD/1MKN/31R4dhPWVHIHCujXSj8q73lBgNhpB2ymOgsIVkKpIZ4
         X3cg7e0NNSSfeOlX2Vo8T/4qfEMkKljA1RtPhZh5xe7X561Vb+6cUmzlBWuMVrorTSmL
         vQqRW4wBwK4XknwC/sNhVNw10D1jDdFcUwEUhoc8036Yj0i14z2mq9HbqByvKHAes4Bm
         8X9iiZBlArIA8+MXyC+fuFZewuofopgMZdyRE9tH+Ov7Ow8saLUnIydwaZNE2WNNOjC/
         5Hz49RCbH2HXxsgtoYl3Do/rPkaKyMwcJ7sjFbJFVquuIKg4VjqTNPYByUOZoORpgGCX
         cg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=JJB89ZnMmLOpI+c/Maj/qhITmXnBFgOUKABGfJ34UPM=;
        b=SomVgj3snGE/AtZHMLiaOTjFoGE/nvDsXWMYnSjaq79fLmzCS1sjikpvnlAoT/m/Ke
         IapKNBImq4butp7K4kWKvUlgmvmgDvOTUSuydW3vVmL0CtFBMtSC0CUSM93UZtWIf1pI
         ALFOwooWsHVQ1sKIFcbTHshCLzp4pSPwey/BGSxlP/GpRTgsBw7dVM55jHQ63h7ccBy1
         w6HslaLpoWwOPlsYlM5UmPAdqlQoolfIQA0y5KYQi3PGTu8L9GP9U/sMpKsUmreIs7OP
         s0elNHUkXicd2NnuZuIOVWYcr58mvhT8SVjZWcTls5yTCD7uE4YpXEMlDv5GMtTt90r5
         uipw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=ehabkost@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <ehabkost@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o127-v6si4853410qkf.68.2018.08.10.05.21.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 05:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=ehabkost@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA80A30820C0;
	Fri, 10 Aug 2018 12:21:34 +0000 (UTC)
Received: from localhost (ovpn-116-45.gru2.redhat.com [10.97.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 296F9756BB;
	Fri, 10 Aug 2018 12:21:33 +0000 (UTC)
Date: Fri, 10 Aug 2018 09:21:32 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	richard.henderson@linaro.org, Cleber Rosa <crosa@redhat.com>
Subject: Re: [Qemu-devel] [RFC PATCH 1/4] scripts/decodetree.py: add a
 disassembly generator (HACK!)
Message-ID: <20180810122132.GN15372@localhost.localdomain>
References: <20180808123934.17450-1-alex.bennee@linaro.org>
 <20180808123934.17450-2-alex.bennee@linaro.org>
 <20180810033200.GA8773@localhost.localdomain>
 <878t5eppm1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878t5eppm1.fsf@linaro.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 10 Aug 2018 12:21:34 +0000 (UTC)
X-TUID: dD72DgcSETV3

On Fri, Aug 10, 2018 at 09:55:50AM +0100, Alex Bennée wrote:
> 
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Wed, Aug 08, 2018 at 01:39:31PM +0100, Alex Bennée wrote:
> >> Given our issues with failing disassembly we could try and re-use the
> >> decode tree data to output what instruction is being decoded. This
> >> will be used if registered as a fall-back for when the "proper"
> >> disassembler fails to decode an instruction.
> >>
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >
> > I don't have an opinion on the approach you are taking, but the
> > Python code you are adding is consistent with the existing style
> > of the script.
> >
> > That said, I find the existing code full of output() calls very
> > hard to read.  If anybody wants to volunteer to improve the
> > readability of the output generation, it would be welcome.
> 
> If we expect to have the script output a number of different forms I
> guess re-factoring it with some sort of template based approach would be
> worthwhile. I wonder if there are other examples in the code base? We
> wouldn't want to have multiple template types.

QAPI scripts also generates C code, and I find them more
readable[1].

I think a true template language would be even better than QAPI's
approach, but I don't see an obvious candidate that would be
worth adding another build dependency to QEMU.


[1] Compare:

def output_decl(self):
    global translate_scope
    global translate_prefix
    output('typedef ', self.base.base.struct_name(),
           ' arg_', self.name, ';\n')
    output(translate_scope, 'bool ', translate_prefix, '_', self.name,
           '(DisasContext *ctx, arg_', self.name,
           ' *a, ', insntype, ' insn);\n')

And:

def gen_visit_members_decl(name):
    return mcgen('''

void visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp);
''',
                 c_name=c_name(name))

-- 
Eduardo
