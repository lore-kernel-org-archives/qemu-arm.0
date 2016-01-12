Received: by 10.25.159.19 with SMTP id i19csp621938lfe;
        Tue, 12 Jan 2016 09:02:15 -0800 (PST)
X-Received: by 10.194.174.73 with SMTP id bq9mr42603321wjc.145.1452618134851;
        Tue, 12 Jan 2016 09:02:14 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com. [2a00:1450:400c:c09::232])
        by mx.google.com with ESMTPS id w127si32452392wmg.35.2016.01.12.09.02.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2016 09:02:14 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) client-ip=2a00:1450:400c:c09::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x232.google.com with SMTP id b14so330845118wmb.1
        for <alex.bennee@linaro.org>; Tue, 12 Jan 2016 09:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=y+qfkkPljpLnm6TGkHhOeO/UncAPPMnkaehpwX+OQ9w=;
        b=EyKBl3CSLDDoS3yci37Ka1430mZsYPyYG0ioWEqRrYZBmSLNnnT2Nv/xWi0MXpkXyo
         mdFxpuh9KWpg0LoS9EP6g2A4HbEd9gSn5IpDN8256MqVb2uaqwiIqi31GJw1FHJs8EAe
         ShIrFK1PgrD1/mJMGsoaJktLuLsIOaYGS5aeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=y+qfkkPljpLnm6TGkHhOeO/UncAPPMnkaehpwX+OQ9w=;
        b=P/VrpWnivZQcCjzKja0b/e66SKVMHQVVKilZNxbNsbMbICCsk9pBhaufWNQIuXngJv
         5KTZ5k5UQGH6ZeVirqRDCMxc1Ddwr6p+2raNzRlOtUqx4f2oHVlp1UlxBB1LSZ6B9h/4
         NteVL3zrYSspT5h2tNaRf/jKIZWS58vveF0JonzkXkNga/BCIdC1FSrEttgI2b03ynIV
         i7jFLenb54qHnHRMUjq00xOhA31+h2OsQsFyzR6CofconvLwopPqWd5dk3GnEAGWO52j
         VKEa2i4yufBeo1sb40tN+IM2Dbduc0boq/QNuU4d5x9O2RCQcXjMBNp/zibma90pxnzx
         g30g==
X-Gm-Message-State: ALoCoQkA07ZYy8X3lCa59Uc2YHq6Jqo6zBNaB/Hy+8YFwhzA/riBxtu1FFkk3OaPikT2zMYoVZaqS5rPCQHFRS+4A00Jy7dINA==
X-Received: by 10.194.209.129 with SMTP id mm1mr107213763wjc.47.1452618134594;
        Tue, 12 Jan 2016 09:02:14 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id t76sm18442151wmd.13.2016.01.12.09.02.12
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 12 Jan 2016 09:02:13 -0800 (PST)
Subject: Re: [PATCH v2 3/7] device_tree: introduce qemu_fdt_node_path
To: David Gibson <david@gibson.dropbear.id.au>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-4-git-send-email-eric.auger@linaro.org>
 <20160111023853.GB22925@voom.redhat.com> <56938586.5050503@linaro.org>
 <20160112042856.GQ22925@voom.redhat.com>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, alex.williamson@redhat.com,
 alex.bennee@linaro.org, thuth@redhat.com, crosthwaitepeter@gmail.com,
 patches@linaro.org, christoffer.dall@linaro.org, pbonzini@redhat.com,
 b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
 thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56953188.3040805@linaro.org>
Date: Tue, 12 Jan 2016 18:02:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160112042856.GQ22925@voom.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: hvisEvOLiop5

Hi David,
On 01/12/2016 05:28 AM, David Gibson wrote:
> On Mon, Jan 11, 2016 at 11:35:50AM +0100, Eric Auger wrote:
>> Hi David,
>> On 01/11/2016 03:38 AM, David Gibson wrote:
>>> On Wed, Jan 06, 2016 at 03:13:21PM +0000, Eric Auger wrote:
>>>> This new helper routine returns the node path of a device
>>>> referred to by its node name and compat string.
>>>
>>> What if there are multiple nodes matching the name and compat?
>> The function would return the first one. I can improve the doc comment.
>> Do you think it is a problem stopping at the first one? Is it a real
>> life test case I have to handle here?
> 
> Well, I don't know of a specific system which will have this, but it's
> absolutely possible to get this situation:  e.g. two different PCI
> busses, both of which have their own slot 0 populated with different
> instances of the same device.
> 
> Whether it's possible for platform devices will depend on the
> platform's specific bus toplogies, but you certainly can't rule it out
> in general.
OK I will handle that case then. I hope I will be able to test it.
> 
> I could consider adding a new libfdt function like
> fdt_node_offset_by_compatible() that searches by name as well.  It's
> just I'm not sure that matching by name and compatible isn't a sign of
> a poor approach in the caller.
well I can't really comment. That looked the most straightforward to me
given the current libfdt API. But not sure it's worth to invest in a new
function in libfdt

Thanks!

Eric
> 
